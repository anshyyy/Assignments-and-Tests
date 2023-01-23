import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BasicOverLayWidget extends StatelessWidget {
  VideoPlayerController controller;

  BasicOverLayWidget({super.key, required this.controller});

  Widget buildIndicator() =>
      VideoProgressIndicator(controller, allowScrubbing: true);
  Widget buildPlay() => controller.value.isPlaying
      ? Container()
      : Container(
          alignment: Alignment.center,
          color: Colors.black26,
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 50,
          ),
        );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () =>
          controller.value.isPlaying ? controller.pause() : controller.play(),
      child: Stack(
        children: [
          buildPlay(),
          Positioned(bottom: 0, left: 0, right: 0, child: buildIndicator()),
        ],
      ),
    );
  }
}
