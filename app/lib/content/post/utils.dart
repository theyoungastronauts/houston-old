import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../navigation/app_router.gr.dart';
import 'providers/post_form_provider.dart';

FloatingActionButton postCreateFloatingActionButton(BuildContext context, WidgetRef ref) {
  return FloatingActionButton(
    onPressed: () {
      ref.read(postFormProvider.notifier).clear();
      AutoRouter.of(context).push(const PostEditScreenRoute());
    },
    child: const Icon(Icons.add),
  );
}
