import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/video/model/video_model.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier {
  VideoPlayerController? videoPlayer;

  // late VideoPlayerController? videoPlayer;
  bool isPlayVideo = true;
  ChewieController? chewieController;
  List<VideoModel> allVideo = [
    VideoModel(title: "Bulleya",video: "https://rr2---sn-4g5edns7.googlevideo.com/videoplayback?expire=1720439032&ei=mHyLZsq5J9ev6dsPl7OAGA&ip=148.251.87.180&id=o-AOTXE1WaWX76xhK2H8qTODDzT2iKU1WhOy5em6iZH4h3&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&mh=Re&mm=31%2C26&mn=sn-4g5edns7%2Csn-f5f7lnld&ms=au%2Conr&mv=u&mvi=2&pl=27&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&cnr=14&ratebypass=yes&dur=186.015&lmt=1706154860866726&mt=1720417008&fvip=3&c=ANDROID_TESTSUITE&txp=4538434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRQIgYmRTQbT2jHfuYtjti7UDXFdrM9Z3AOLkbdaC-rwvCKUCIQCB-pkR4uT5vnvb5AdBrTLOTpEXFPzFUuSpnaLv0U3E_g%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl&lsig=AHlkHjAwRgIhAIy19LOIk3L0drXBpm1KtffPvN5o9HQY-gzKFJAaVtGRAiEAnz6Du7l4onlUCDi-zStsVa4DSphARXZ9TqAGtLc-BOo%3D&title=Bulleya%20%7C%20Full%20Song%20%7C%20Sultan%20%7C%20Salman%20Khan%2C%20Anushka%20Sharma%20%7C%20Papon%20%7C%20Vishal%20%26%20Shekhar%20%7C%20Irshad%20Kamil",image: "https://i.ytimg.com/vi/a9Hxkc9YxGE/hq720.jpg?"),
    VideoModel(title: "Dildara",video: "https://rr4---sn-4g5lznl6.googlevideo.com/videoplayback?expire=1720447315&ei=85yLZtK0M9Tl6dsP_Ni3-A8&ip=168.119.148.247&id=o-AC7PqW83uBF4k9cooaBzuEBdMRTgqA0kQ71fM7W2uf03&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&mh=Gr&mm=31%2C29&mn=sn-4g5lznl6%2Csn-4g5ednly&ms=au%2Crdu&mv=m&mvi=4&pl=23&initcwndbps=591250&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&cnr=14&ratebypass=yes&dur=270.071&lmt=1706313857650261&mt=1720425433&fvip=2&c=ANDROID_TESTSUITE&txp=4538434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRAIgcsX2adYre3mdpCMS6Bt3TM_NvuBMKFZs03rXdSVkgecCIDKy9KMv9OwQ9PlHW3lUFA3xnOotd04DrgaPEnYKwKEw&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AHlkHjAwRQIgTtZzLjJUrtwJLQ_iEeyIPkIhEwmj7lUkRQEeUMUvHxMCIQCIWoOALrYVpcvIo9kX0yAEnRKo0M_iaBzPim4ORHfp_w%3D%3D&title=Lyrical%20Video%3A%20Dildara%20Song%20%7C%20Ra.One%20%7C%20ShahRukh%20Khan%2C%20Kareena%20Kapoor",image: "https://i.ytimg.com/vi/gQ5qVtoLMk4/hq720.jpg?"),
    VideoModel(title: "Laung da lakshkara",video: "https://rr1---sn-4g5e6ns6.googlevideo.com/videoplayback?expire=1720455279&ei=D7yLZvurEaHi6dsPlKes8AE&ip=148.251.87.183&id=o-AGOyQRtEfVzGQE9Cu65txEUp0B7Fjgz6d_UaHNwivbU0&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&mh=vB&mm=31%2C26&mn=sn-4g5e6ns6%2Csn-f5f7lne6&ms=au%2Conr&mv=u&mvi=1&pl=27&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&cnr=14&ratebypass=yes&dur=273.902&lmt=1705762059892788&mt=1720432548&fvip=1&c=ANDROID_TESTSUITE&txp=4538434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRQIhAJw4WfKIgp9ye0_mfT1yo8x3rw2D95kYmTfDyTGCNYKvAiBKtjOlxa9sDyNZXO5ITX6U7v5O0utENjl8wWl8TDoPtQ%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl&lsig=AHlkHjAwRQIgMjpKp6750GEs5dZdG875w3nx1PLQxuLjOBY58mTdfUACIQCfflZZvVZQU0AlYxhAS_-b_DNd-DSx5QYFMAg_ezvoLQ%3D%3D&title=Laung%20Da%20Lashkara%20(Official%20full%20song)%20%22Patiala%20House%22%20%7C%20Feat.%20Akshay%20Kumar",image: "https://i.ytimg.com/vi/MS55Ke6AQTc/hqdefault.jpg?"),
    // https://i.ytimg.com/vi/a9Hxkc9YxGE/hq720.jpg?
  VideoModel(title: "Teri ore",video: "https://rr2---sn-4g5lznle.googlevideo.com/videoplayback?expire=1720440181&ei=FYGLZvbPGsqOi9oPqaaywA4&ip=162.55.96.91&id=o-AFe6h03tyLMkGZ3DzF3HAxwKThigVcVcmKyHubfFVrrJ&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&mh=7U&mm=31%2C26&mn=sn-4g5lznle%2Csn-h0jelne6&ms=au%2Conr&mv=u&mvi=2&pl=23&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&gir=yes&clen=20637363&ratebypass=yes&dur=310.381&lmt=1705767022434424&mt=1720418447&fvip=5&c=ANDROID_TESTSUITE&txp=5538434&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Cgir%2Cclen%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRAIgZ0prZKKPyqy1xz_N4ryuEb4ScY4GBbLbO3s8qaJMX40CIFfGcdg8HHf6-sSqSzR_tqqJKMqPjW7kRT1wLhRZULbM&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl&lsig=AHlkHjAwRgIhAM8bYgAYZCYVDLTJEYJ260Ci9Fd5gjd9YY8SvHY39_ZtAiEAx0nFOCttwAq2xO9V3YLOJwuZ1-nM2_aQJOnho36cyLQ%3D&title=Tere%20Ore%20-Singh%20Is%20King%20(2008)%20%5B%20BluRay%20%5D",image: "https://i.ytimg.com/vi/GLEx6bhPu7s/hq720.jpg?"),
  ];
  int selectedIndex = 0;

  void initVideo() {
    // videoPlayer = VideoPlayerController.asset("asset/video/new.mp4");

    VideoPlayerController videoPlayer = VideoPlayerController.networkUrl(Uri.parse(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
    videoPlayer.initialize();
  }

  void init() {
    videoPlayer = VideoPlayerController.networkUrl(Uri.parse(
      "${allVideo[selectedIndex]}",));
        // 'https://rr5---sn-4g5edndk.googlevideo.com/videoplayback?expire=1720444026&ei=GpCLZs_gOeTJi9oPvdWbOA&ip=142.132.137.4&id=o-AFWFLBd8-bI8C4l1STOgK75_YF0C8T0bgMMSjBIxcoFq&itag=18&source=youtube&requiressl=yes&xpc=EgVo2aDSNQ%3D%3D&mh=hu&mm=31%2C26&mn=sn-4g5edndk%2Csn-f5f7kn7e&ms=au%2Conr&mv=m&mvi=5&pl=22&initcwndbps=740000&vprv=1&svpuc=1&mime=video%2Fmp4&rqh=1&cnr=14&ratebypass=yes&dur=33.320&lmt=1670158149848670&mt=1720422066&fvip=4&c=ANDROID_TESTSUITE&txp=5310224&sparams=expire%2Cei%2Cip%2Cid%2Citag%2Csource%2Crequiressl%2Cxpc%2Cvprv%2Csvpuc%2Cmime%2Crqh%2Ccnr%2Cratebypass%2Cdur%2Clmt&sig=AJfQdSswRQIgZ7i88soxjgr5OagBKf8jLlwLcBM4f_EPg5gvEu3aXroCIQC1gNzh0Tt1ORKfsCFpxLUPiFOb-VX7CDcsAC1_Ulg3gg%3D%3D&lsparams=mh%2Cmm%2Cmn%2Cms%2Cmv%2Cmvi%2Cpl%2Cinitcwndbps&lsig=AHlkHjAwRAIgWy6qgSqqjM81k0TFY434G2omo9M2k9A8wJSXMLQ2uwoCIH-PEx4acVQDQR8WF_kRa1oV7FeN2QmNzpRkEvtVtxgB&title=Nature%20Video%2030%20Seconds%7CWhatsApp%20Status%20Video%7CNature%20Background%20Videos'));
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

  void selectIndex(int index)
  {
    selectedIndex = index;
    notifyListeners();
  }
}
