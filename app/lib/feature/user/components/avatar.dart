import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:houston_app/feature/user/models/user.dart';

class Avatar extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          border: Border.all(
            width: 1,
            color: Theme.of(context).colorScheme.primary,
          ),
          borderRadius: BorderRadius.circular(size / 2),
        ),
        child: user.image.isNotEmpty
            ? CachedNetworkImage(imageUrl: user.image)
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
    );
  }
}
