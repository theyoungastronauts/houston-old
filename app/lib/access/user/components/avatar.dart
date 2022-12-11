import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../../../core/utils/image.dart';
import '../../../navigation/app_router.gr.dart';
import '../models/user.dart';

class Avatar extends BaseComponent {
  final double size;
  final bool interactive;
  final User user;

  const Avatar(
    this.user, {
    Key? key,
    this.size = 32.0,
    this.interactive = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: interactive
          ? () {
              AutoRouter.of(context).push(UserDetailScreenRoute(uuid: user.uuid));
            }
          : null,
      child: SizedBox(
        width: size,
        height: size,
        child: Container(
          width: size,
          height: size,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(size / 2),
          ),
          child: user.image.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: ImageUrlBuilder.resize(user.image, width: size),
                  width: size,
                  height: size,
                  fit: BoxFit.cover,
                )
              : Center(
                  child: Text(
                    user.initials,
                    style: TextStyle(
                      fontSize: size / 2.2,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
