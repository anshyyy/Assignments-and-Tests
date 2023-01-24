import 'package:celeb/utils/videoPlay.dart';
import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';

class MakeVideo extends StatefulWidget {
  String image;
  String url;
  MakeVideo({super.key, required this.url, required this.image});

  @override
  State<MakeVideo> createState() => _MakeVideoState();
}

class _MakeVideoState extends State<MakeVideo> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    player.setDataSource(widget.url, autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: AspectRatio(
        aspectRatio: 1.5 / 1,
        child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                  image: AssetImage("assets/images/" + widget.image),
                  fit: BoxFit.cover)),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(.3)
              ],
            )),
            child: Align(
                child: Icon(Icons.play_arrow, color: Colors.grey, size: 50)),
          ),
        ),
      ),
    );
  }
}
