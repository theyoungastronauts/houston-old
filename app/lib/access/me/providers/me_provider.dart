import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/me_user.dart';
import '../services/me_service.dart';

final meProvider = FutureProvider<MeUser?>((ref) async {
  return MeService().retrieve();
});
