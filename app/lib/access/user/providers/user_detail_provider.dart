import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../services/user_service.dart';

final userDetailProvider = FutureProvider.family<User?, String>((ref, String uuid) async {
  return UserService().retrieve(uuid);
});
