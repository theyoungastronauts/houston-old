import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/feature/post/models/post.dart';
import 'package:houston_app/core/components/base_component.dart';


class PostCard extends BaseComponent {
  final Post post;
  const PostCard(this.post, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Text(post.uuid),
    );
  }
}