import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/screens/base_screen.dart';
import 'package:houston_app/media/video/components/video_list.dart';

class VideoListScreen extends BaseScreen {
  const VideoListScreen({Key? key})
      : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Video List"),
      actions: const [],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return const VideoList();
  }
}
