import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/presentation/widgets/shared/video_buttons.dart';
import 'package:toktik/presentation/widgets/video/full_screen_player.dart';

class VideoScrollableView extends StatelessWidget {
  const VideoScrollableView({super.key, required this.videos});

  final List<VideoPost> videos;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final VideoPost videoPosts = videos[index];
        return Stack(
          children: [
            SizedBox.expand(
              child: FullScreenPlayer(
                  videoUrl: videoPosts.videoUrl, caption: videoPosts.caption),
            ),
            Positioned(
                right: 5, bottom: 40, child: VideoButtons(video: videoPosts))
          ],
        );
      },
    );
  }
}
