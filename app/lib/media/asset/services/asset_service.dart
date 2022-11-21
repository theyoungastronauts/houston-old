import 'dart:typed_data';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:houston_app/core/services/base_service.dart';
import 'package:houston_app/core/utils/env.dart';
import 'package:houston_app/core/utils/image.dart';
import 'package:houston_app/core/utils/logging.dart';
import 'package:houston_app/core/utils/singletons.dart';
import 'package:houston_app/media/asset/models/asset.dart';
import 'package:houston_app/media/asset/models/asset_type.dart';
import 'package:houston_app/media/asset/models/new_asset.dart';

class AssetService extends BaseService {
  static const basePath = '/asset';

  Future<NewAsset> _initAsset(MediaType mediaType) async {
    final _params = {'content_type': mediaType.name};
    final data = await postHttp("$basePath/${mediaType.type}", params: _params);

    return NewAsset.fromJson(data);
  }

  Future<Asset?> create(MediaType mediaType, Uint8List bytes) async {
    final newAsset = await _initAsset(mediaType);

    final success = await _uploadToS3(newAsset, mediaType, bytes);

    if (success && newAsset.key.isNotEmpty) {
      final url = "${Env.mediaBaseUrl}/${newAsset.key}";
      final asset = await confirmAsset(url, mediaType: mediaType);
      return asset;
    }

    return null;
  }

  Future<Asset?> createFromBase64(
    MediaType mediaType,
    String base64String,
  ) async {
    final str = base64String.replaceAll("data:image/jpg;base64,b'", "").replaceAll("'", '');
    Uint8List decodedbytes = base64.decode(str);

    return await create(mediaType, decodedbytes);
  }

  Future<Asset?> createFromUrl(
    MediaType mediaType,
    String url,
  ) async {
    final bytes = await imageUrlToBytes(url);
    return await create(mediaType, bytes);
  }

  Future<bool> _uploadToS3(NewAsset newAsset, MediaType mediaType, Uint8List bytes) async {
    try {
      final dio = Dio();
      final options = Options(
        contentType: mediaType.name,
        headers: newAsset.fields,
      );

      final data = {};

      for (final entry in newAsset.fields.entries) {
        data[entry.key] = entry.value;
      }

      FormData formData = FormData.fromMap({
        'file': MultipartFile.fromBytes(
          bytes,
          filename: 'test',
        ),
        ...data
      });

      await dio.post(newAsset.url, data: formData, options: options);

      return true;
    } catch (e, st) {
      singleton<Log>().error("_uploadToS3 Error", e, st);
      return false;
    }
  }

  Future<Asset?> confirmAsset(
    String url, {
    required MediaType mediaType,
    int attemptNumber = 1,
    int maxAttempts = 5,
    int sleepMs = 1000,
  }) async {
    try {
      // have to put it right in the URL or dio tries to encode it
      final asset = await getHttp("$basePath/${mediaType.type}?url=$url");

      return Asset.fromJson(asset);
    } catch (e) {
      if (attemptNumber <= maxAttempts) {
        singleton<Log>().warn("Not confirmed - trying again in $sleepMs ms");

        await Future.delayed(Duration(milliseconds: sleepMs));
        return await confirmAsset(
          url,
          mediaType: mediaType,
          attemptNumber: attemptNumber + 1,
          maxAttempts: maxAttempts,
          sleepMs: (sleepMs * 1.5).round(),
        );
      }
      singleton<Log>().warn("Could not confirm after $maxAttempts tries");
      return null;
    }
  }

  Future<Asset?> chooseImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image, withData: true);
    if (result == null) return null;
    if (result.files.isEmpty) return null;

    final f = result.files.first;
    final mediaType = MediaType.fromExtension(f.extension ?? 'jpg');
    final asset = await create(mediaType, f.bytes!);

    return asset;
  }
}
