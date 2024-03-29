import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  const VideoButtons({super.key, required this.video});

  final VideoPost video;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15,
      direction: Axis.vertical,
      children: [
        _CustomIconButton(
            value: video.likes,
            iconColor: Colors.red,
            iconData: Icons.favorite),
        _CustomIconButton(
            value: video.views, iconData: Icons.remove_red_eye_outlined),
        SpinPerfect(
            infinite: true,
            duration: const Duration(seconds: 5) ,
            child: const _CustomIconButton(
                value: 0, iconData: Icons.play_circle_outline))
      ],
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  const _CustomIconButton(
      {super.key, required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  final int value;
  final IconData iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 30,
            )),
        if (value > 0) Text(HumanFormats.humanReadableNumber(value.toDouble()))
      ],
    );
  }
}
