import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/screens/base_screen.dart';
import '../../../core/components/empty_placeholder.dart';
import '../providers/video_detail_provider.dart';

class VideoDetailScreen extends BaseScreen {
  final String uuid;
  const VideoDetailScreen({
    Key? key,
    @PathParam('uuid') required this.uuid,
  }) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final video = ref.watch(videoDetailProvider(uuid));

    return video.when(
      loading: () => AppBar(
        title: const Text("Video"),
      ),
      data: (video) => AppBar(
        title: Text(video.uuid),
      ),
      error: (_, __) => AppBar(
        title: const Text("Error"),
      ),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final _video = ref.watch(videoDetailProvider(uuid));

    return _video.when(
      data: (video) => Text(video.uuid),
      error: (_, __) => const EmptyPlaceholder(title: "Error"),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
