import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/media/video/models/video.dart';
import 'package:houston_app/core/components/base_component.dart';


class VideoCard extends BaseComponent {
  final Video video;
  const VideoCard(this.video, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Text(video.uuid),
    );
  }
}