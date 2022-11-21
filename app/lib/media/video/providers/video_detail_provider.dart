import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/media/video/models/video.dart';
import 'package:houston_app/media/video/services/video_service.dart';

final videoDetailProvider =
    FutureProvider.family<Video, String>((ref, String uuid) async {
  return VideoService().retrieve(uuid);
});
