import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/video.dart';
import '../services/video_service.dart';

final videoDetailProvider = FutureProvider.family<Video, String>((ref, String uuid) async {
  return VideoService().retrieve(uuid);
});
