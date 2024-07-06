import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    providerR!.initVideo();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 200,
            width: 200,
            child: Center()
            // providerW!.videoPlayer!.value.aspectRatio,
          ),
          IconButton.filled(onPressed: () {
            providerW!.videoPlayer!.play();
          }, icon: Icon(Icons.play_arrow)),
          IconButton.filled(onPressed: () {
            providerW!.videoPlayer!.pause();
          }, icon: Icon(Icons.pause))
        ],
      ),
    );
  }
}
