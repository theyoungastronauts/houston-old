import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utils/screen.dart';

abstract class BaseStatefulComponent extends ConsumerStatefulWidget {
  const BaseStatefulComponent({
    Key? key,
  }) : super(key: key);

  @override
  BaseComponentState createState() => BaseComponentState();
}

class BaseComponentState<T extends BaseStatefulComponent> extends ConsumerState<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (ScreenUtils.size(context)) {
      case ScreenSize.lg:
        return bodyLg(context, ref);
      case ScreenSize.md:
        return bodyMd(context, ref);
      case ScreenSize.sm:
        return body(context, ref);
    }
  }

  Widget body(BuildContext context, WidgetRef ref) {
    return const SizedBox.shrink();
  }

  Widget bodyMd(BuildContext context, WidgetRef ref) {
    return body(context, ref);
  }

  Widget bodyLg(BuildContext context, WidgetRef ref) {
    return bodyMd(context, ref);
  }
}
