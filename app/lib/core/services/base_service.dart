import 'dart:io';

import '../../access/auth/models/token.dart';
import '../utils/env.dart';
import 'package:dio/dio.dart';

class BaseService {
  Map<String, dynamic> _headers([bool auth = true]) {
    return {
      HttpHeaders.contentTypeHeader: "application/json",
      HttpHeaders.acceptHeader: "application/json",
      // HttpHeaders.acceptLanguageHeader: Locale.shortName,
      ...auth && Token.fromStorage().access.isNotEmpty ? {'Authorization': "Bearer ${Token.fromStorage().access}"} : {}
    };
  }

  BaseOptions _options({bool auth = true}) {
    return BaseOptions(baseUrl: Env.apiBaseUrl, headers: _headers(auth));
  }

  String _cleanPath(String path) {
    if (!path.endsWith("/")) {
      return "$path/";
    }

    return path;
  }

  Map<String, dynamic> buildPage(int page) {
    return {'page': page};
  }

  Map<String, dynamic> buildOffset(int page, int limit) {
    return {'offset': (page * limit) - limit};
  }

  Map<String, dynamic> buildLimit(int limit) {
    return {'limit': limit};
  }

  Map<String, dynamic> buildOwner(int userId) {
    return {'owner': userId};
  }

  Map<String, dynamic> buildOrdering(String key, [bool isAscending = true]) {
    return {"ordering": "${isAscending ? '' : '-'}$key"};
  }

  Map<String, dynamic> buildSearch(String search) {
    return {'search': search};
  }

  Future<Map<String, dynamic>> getHttp(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
  }) async {
    try {
      var response = await Dio(_options(auth: auth)).get(
        _cleanPath(path),
        queryParameters: params,
      );

      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }
      if (response.data.runtimeType == String) {
        return {};
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> postHttp(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
  }) async {
    try {
      var response = await Dio(_options(auth: auth)).post(
        _cleanPath(path),
        data: params,
      );

      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }

      if (response.data.runtimeType == String) {
        return {};
      }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> patchHttp(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
  }) async {
    try {
      var response = await Dio(_options(auth: auth)).patch(
        _cleanPath(path),
        data: params,
      );
      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }
      if (response.data.runtimeType == String) {
        return {};
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> putHttp(
    String path, {
    Map<String, dynamic> params = const {},
    bool auth = true,
  }) async {
    try {
      var response = await Dio(_options(auth: auth)).put(
        _cleanPath(path),
        data: params,
      );
      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }
      if (response.data.runtimeType == String) {
        return {};
      }
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> deleteHttp(
    String path, {
    bool auth = true,
  }) async {
    try {
      var response = await Dio(_options(auth: auth)).delete(
        _cleanPath(path),
      );

      if (response.statusCode == 204) {
        return {};
      }
      if (response.data == null) {
        return {};
      }
      if (response.data.runtimeType == String) {
        return {};
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
