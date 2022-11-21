import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/access/me/models/me_user.dart';
import 'package:houston_app/access/me/services/me_service.dart';

final meProvider = FutureProvider<MeUser?>((ref) async {
  return MeService().retrieve();
});
