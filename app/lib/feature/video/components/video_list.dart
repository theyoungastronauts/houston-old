import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:houston_app/core/components/base_component.dart';
import 'package:houston_app/core/components/infinite_list.dart';
import 'package:houston_app/feature/video/components/video_card.dart';
import 'package:houston_app/feature/video/models/video.dart';
import 'package:houston_app/feature/video/providers/video_list_provider.dart';

class VideoList extends BaseComponent {
  const VideoList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final listProvider = ref.watch(videoListProvider.notifier);

    return InfiniteList<Video>(
      pagingController: listProvider.pagingController,
      itemBuilder: (context, video, index) => VideoCard(video),
      emptyText: "No Videos",
      onRefresh: listProvider.refresh,
    );
  }
}