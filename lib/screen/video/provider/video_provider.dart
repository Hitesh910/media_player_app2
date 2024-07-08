import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier {
  VideoPlayerController? videoPlayer;

  // late VideoPlayerController? videoPlayer;
  bool isPlayVideo = true;
  ChewieController? chewieController;
  List<VideoPlayer> allVideo = [];

  void initVideo() {
    // videoPlayer = VideoPlayerController.asset("asset/video/new.mp4");

    VideoPlayerController videoPlayer = VideoPlayerController.networkUrl(Uri.parse(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
    videoPlayer.initialize();
  }

  void init() {
    videoPlayer = VideoPlayerController.networkUrl(Uri.parse(
        'https://rr5---sn-4g5edndk.googlevideo.com/videoplayback?expire=1720444026&ei=GpCLZs_gOeTJi9oPvdWbOA&ip=142.132.137.4&id=o-AFWFLBd8-bI8C4l1STOgK75_YF0C8T0bgMMSjBIxcoFq&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&mh=hu&mm=31%2C26&mn=sn-4g5edndk%2Csn-f5f7kn7e&ms=au%2Conr&mv=m&mvi=5&pl=22&initcwndbps=740000&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&cnr=14&ratebypass=yes&dur=33.320&lmt=1670158149848670&mt=1720422066&fvip=4&c=ANDROID_TESTSUITE&txp=5310224&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRQIgZ7i88soxjgr5OagBKf8jLlwLcBM4f_EPg5gvEu3aXroCIQC1gNzh0Tt1ORKfsCFpxLUPiFOb-VX7CDcsAC1_Ulg3gg%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AHlkHjAwRAIgWy6qgSqqjM81k0TFY434G2omo9M2k9A8wJSXMLQ2uwoCIH-PEx4acVQDQR8WF_kRa1oV7FeN2QmNzpRkEvtVtxgB&title=Nature%20Video%2030%20Seconds%7CWhatsApp%20Status%20Video%7CNature%20Background%20Videos'));
    videoPlayer!.initialize();
    
    chewieController = ChewieController(videoPlayerController: videoPlayer!,autoPlay: true);
    notifyListeners();
  }

  void playAndPause() {

    if (isPlayVideo) {
      videoPlayer!.play();
    }
    else
      {
        videoPlayer!.pause();
      }

    isPlayVideo = !isPlayVideo;
    notifyListeners();
  }
}
