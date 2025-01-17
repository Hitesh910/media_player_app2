import 'package:chewie/chewie.dart';
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
  VideoProvider? providerR;
  VideoProvider? providerW;

  // VideoPlayerController? videoPlayer;
  ChewieController? chewieController;

   @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // videoPlayer = VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));
  //   // videoPlayer!.initialize();
  //   // providerR!.initVideo();
  //   context.read<VideoProvider>().init();
  // }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<VideoProvider>();
    providerW = context.watch<VideoProvider>();
    return Scaffold(
      appBar: AppBar(title: Text("Media_Bosster"),),
        body: Column(
      children: [
        Expanded(
          child: ListView.builder(padding: EdgeInsets.all(10),
            itemCount: providerW!.allVideo.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    leading: Image(image: NetworkImage("${providerW!.allVideo[index].image}")),
                    title: Text("${providerW!.allVideo[index].title}"),
                   onTap: () {
                      providerW!.selectIndex(index);
                      Navigator.pushNamed(context, 'videoLoad');
                   },
                  ),
                  Divider(),
                ],
              );
            },
          ),
        ),
      ],
    ));

    //     ListView.builder(
    //   itemCount: providerW!.allVideo.length,
    //   itemBuilder: (context, index) {
    //     return Expanded(
    //       child: ListTile(
    //         title: Text("${providerR!.allVideo[index].title}"),
    //         leading: Container(
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                   image:
    //                       NetworkImage("${providerR!.allVideo[index].image}"))),
    //         ),
    //       ),
    //     );
    //   },
    // )
    // );
  }
}

//   Column(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     Center(
//       child: Container(
//           height: 200,
//           width: 200,
//           child: AspectRatio(
//               aspectRatio: providerW!.videoPlayer!.value.aspectRatio,
//               child: Chewie(controller: providerW!.chewieController!)
//             // VideoPlayer(providerW!.videoPlayer!),
//           )
//         // providerW!.videoPlayer = VideoPlayerController.networkUrl(Uri.parse(
//         //     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
//         // providerW!.videoPlayer!.value.aspectRatio,
//       ),
//     ),
//     IconButton.filled(
//       onPressed: () {
//         providerR!.playAndPause();
//         // providerW!.videoPlayer!.play();
//       },
//       icon: providerW!.isPlayVideo ? Icon(Icons.play_arrow)
//           : Icon(Icons.pause),),
//     IconButton.filled(
//         onPressed: () {
//           providerR!.videoPlayer!.pause();
//         },
//         icon: const Icon(Icons.pause))
//   ],
// ),);

// Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Center(
// child: Container(
// height: 200,
// width: 200,
// child: AspectRatio(
// aspectRatio: providerW!.videoPlayer!.value.aspectRatio,
// child: Chewie(controller: providerW!.chewieController!)
// // VideoPlayer(providerW!.videoPlayer!),
// )
// // providerW!.videoPlayer = VideoPlayerController.networkUrl(Uri.parse(
// //     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"));
// // providerW!.videoPlayer!.value.aspectRatio,
// ),
// ),
// IconButton.filled(
// onPressed: () {
// providerR!.playAndPause();
// // providerW!.videoPlayer!.play();
// },
// icon: providerW!.isPlayVideo ? Icon(Icons.play_arrow)
//     : Icon(Icons.pause),),
// IconButton.filled(
// onPressed: () {
// providerR!.videoPlayer!.pause();
// },
// icon: const Icon(Icons.pause))
// ],
// ),);
