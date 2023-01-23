import 'package:celeb/util/VideoPlayerWidget.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlay extends StatefulWidget {
  const VideoPlay({super.key});

  @override
  State<VideoPlay> createState() => _VideoPlayState();
}

class _VideoPlayState extends State<VideoPlay> {
  late VideoPlayerController _playerController;
  final url = Uri.parse("https://www.youtube.com/watch?v=SLEvWp8JS1c");

  @override
  void initState() {
    super.initState();
    _playerController = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
      ..addListener(() {
        print(_playerController.value);
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) => _playerController.play());
  }

  @override
  void dispose() {
    super.dispose();
    _playerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = _playerController.value.volume == 0;
    return Column(
      children: [
        VideoPlayerWidget(controller: _playerController),
        if (_playerController != null && _playerController.value.isInitialized)
          CircleAvatar(
              radius: 30,
              backgroundColor: Colors.red,
              child: IconButton(
                onPressed: () {
                  _playerController.setVolume(isMuted ? 1 : 0);
                },
                icon: Icon(
                  isMuted ? Icons.volume_mute : Icons.volume_up,
                  color: Colors.white,
                ),
              ))
      ],
    );
  }
}
