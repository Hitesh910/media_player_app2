import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/video/provider/video_provider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  // VideoProvider? providerR;
  // VideoProvider? providerW;
  late VideoPlayerController videoPlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayer = VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
    videoPlayer.initialize();
    // providerR!.initVideo();
  }

  @override
  Widget build(BuildContext context) {
    // providerR = context.read<VideoProvider>();
    // providerW = context.watch<VideoProvider>();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 200,
                width: 200,
                child: AspectRatio(
                  aspectRatio: videoPlayer.value.aspectRatio,
                  child: VideoPlayer(videoPlayer),
                )
                // providerW!.videoPlayer = VideoPlayerController.networkUrl(Uri.parse(
                //     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
                // providerW!.videoPlayer!.value.aspectRatio,
                ),
          ),
          IconButton.filled(
              onPressed: () {
                videoPlayer.play();
              },
              icon: const Icon(Icons.play_arrow)),
          IconButton.filled(
              onPressed: () {
                videoPlayer.pause();
              },
              icon: const Icon(Icons.pause))
        ],
      ),
    );
  }
}
