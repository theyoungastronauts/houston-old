import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/feature/auth/services/me_service.dart';
import 'package:houston_app/feature/user/models/authenticated_user.dart';

final meProvider = FutureProvider<AuthenticatedUser?>((ref) async {
  return MeService().retrieve();
});
