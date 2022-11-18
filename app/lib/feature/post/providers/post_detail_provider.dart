import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/feature/post/models/post.dart';
import 'package:houston_app/feature/post/services/post_service.dart';

final postDetailProvider =
    FutureProvider.family<Post, String>((ref, String uuid) async {
  return PostService().retrieve(uuid);
});
