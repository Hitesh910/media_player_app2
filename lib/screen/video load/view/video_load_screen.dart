import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../video/provider/video_provider.dart';

class VideoLoadScreen extends StatefulWidget {
  const VideoLoadScreen({super.key});

  @override
  State<VideoLoadScreen> createState() => _VideoLoadScreenState();
}

class _VideoLoadScreenState extends State<VideoLoadScreen> {
  VideoProvider? providerR;
  VideoProvider? providerW;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<VideoProvider>().init();
  }
  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 350,
                width: MediaQuery.sizeOf(context).width,
                child: AspectRatio(
                    aspectRatio: providerW!.videoPlayer!.value.aspectRatio,
                    child: Chewie(controller: providerW!.chewieController!)
                    )
                ),
          ),
          IconButton.filled(
            onPressed: () {
              providerR!.playAndPause();
// providerW!.videoPlayer!.play();
            },
            icon: providerW!.isPlayVideo
                ? Icon(Icons.play_arrow)
                : Icon(Icons.pause),
          ),
          IconButton.filled(
              onPressed: () {
                providerR!.videoPlayer!.pause();
              },
              icon: const Icon(Icons.pause))
        ],
      ),

      // Column(children: [
      //   Center(child: Text("Video"),)
      // ],),
    );
  }
}
