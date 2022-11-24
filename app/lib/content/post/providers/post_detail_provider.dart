import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post.dart';
import '../services/post_service.dart';

final postDetailProvider = FutureProvider.family<Post, String>((ref, String uuid) async {
  return PostService().retrieve(uuid);
});
