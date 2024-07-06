import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/dash/view/dash_screen.dart';
import 'package:media_bosster_app/screen/home/model/home_model.dart';
import 'package:media_bosster_app/screen/provider/music_provider.dart';
import 'package:media_bosster_app/screen/video/view/video_screen.dart';
import 'package:provider/provider.dart';
import '../provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;
  MusicProvider? mproviderR;
  MusicProvider? mproviderW;
  PageController pageController =
      PageController(viewportFraction: 0.8, keepPage: true);
  AssetsAudioPlayer assetsAudio = AssetsAudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     context.read<MusicProvider>().initAudio();
    //  assetsAudio.open(Audio("assets/audio/audio1.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<HomeProvider>();
    providerW = context.watch<HomeProvider>();
    mproviderR = context.read<MusicProvider>();
    mproviderW = context.watch<MusicProvider>();
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Media Bosster"),
      // ),
      body: Column(
        children: [
          providerW!.selectIndex == 0
          ?Expanded(child: DashScreen())
              :Expanded(child: VideoScreen())
        ],
      ),
      bottomNavigationBar:
      Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 50,width: MediaQuery.sizeOf(context).width,color: Colors.red,child: ListTile(
        leading: Image.network(
            "${mproviderR!.allList[mproviderR!.aIndex][mproviderW!.index].image}"),
        title: Text("${mproviderR!.allList[mproviderR!.aIndex][mproviderW!.index].title}"),
        onTap: () {
          // mproviderR!.checkIndex(mindex);
          // mproviderW!.isPlay = false;
           Navigator.pushNamed(context, 'music');
          // showMusic();
        },
      ),),
          BottomNavigationBar(
            currentIndex: providerW!.selectIndex,
            onTap: (value) {
              providerR!.bottomIndex(value);
              // mproviderR!.songIndex(value);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "Music"),
              BottomNavigationBarItem(icon: IconButton.filledTonal(icon: Icon(Icons.add), onPressed: () {  },), label: "Music"),

              BottomNavigationBarItem(icon: Icon(Icons.video_camera_back_rounded),label: "Video"),
            ],
          ),
        ],
      ),
    );
  }

  // void showMusic()
  // {
  //   showModalBottomSheet(context: context, builder: (context) {
  //   return  Container(alignment: Alignment.topCenter,child: Column(
  //       children: [
  //         const Spacer(),
  //         Container(
  //           height: 200,
  //           width: 200,
  //           // color: Colors.white,
  //           decoration: BoxDecoration(
  //               color: Colors.white,
  //               boxShadow: const [
  //                 BoxShadow(blurRadius: 10, spreadRadius: -5)
  //               ],
  //               borderRadius: const BorderRadius.all(Radius.circular(8)),
  //               image: DecorationImage(
  //                   image: NetworkImage(
  //                       "${mproviderW!.allList[context.read<MusicProvider>().aIndex][mproviderW!.index].image}"))),
  //         ),
  //         const Spacer(),
  //         Slider(
  //           value: mproviderW!.currentDuration.inSeconds.toDouble(),
  //           max: mproviderW!.endDuration.inSeconds.toDouble(),
  //           onChanged: (value) {
  //             mproviderW!.assetsAudio.seek(Duration(seconds: value.toInt()));
  //           },
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 12, bottom: 5, right: 12),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 "${mproviderW!.currentDuration}",
  //                 style: const TextStyle(color: Colors.white),
  //               ),
  //               Text(
  //                 "${mproviderW!.endDuration}",
  //                 style: const TextStyle(color: Colors.white),
  //               )
  //             ],
  //           ),
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             IconButton(
  //                 onPressed: () {},
  //                 icon: const Icon(
  //                   Icons.shuffle,
  //                   color: Colors.white,
  //                 )),
  //             const Spacer(),
  //             IconButton(
  //                 onPressed: () async {
  //                   await mproviderW!.assetsAudio.previous();
  //                   mproviderR!.endDurationSong();
  //                   mproviderW!.previousIndex(mproviderW!.index);
  //                   mproviderW!.isPlay = false;
  //                 },
  //                 icon: const Icon(
  //                   Icons.skip_previous,
  //                   color: Colors.white,
  //                   size: 50,
  //                 )),
  //             IconButton.filled(
  //                 style: const ButtonStyle(
  //                   backgroundColor: WidgetStatePropertyAll(Colors.white),
  //                 ),
  //                 onPressed: () {
  //                   mproviderW!.plyAndPause();
  //                 },
  //                 icon: mproviderW!.isPlay
  //                     ? const Icon(
  //                   Icons.play_arrow,
  //                   color: Colors.deepPurple,
  //                   size: 50,
  //                 )
  //                     : const Icon(
  //                   Icons.pause,
  //                   color: Colors.deepPurple,
  //                   size: 50,
  //                 )),
  //             IconButton(
  //                 onPressed: () async {
  //                   await mproviderW!.assetsAudio.next();
  //                   mproviderR!.endDurationSong();
  //                   mproviderW!.nextIndex(mproviderW!.index!);
  //                   mproviderW!.isPlay = false;
  //                 },
  //                 icon: const Icon(
  //                   Icons.skip_next,
  //                   color: Colors.white,
  //                   size: 50,
  //                 )),
  //             const Spacer(),
  //             IconButton(
  //                 onPressed: () {},
  //                 icon: const Icon(
  //                   Icons.loop,
  //                   color: Colors.white,
  //                 ))
  //           ],
  //         ),
  //         // Row(children: [Text("00:00:00"),Text("00:00:00")],),
  //         const SizedBox(
  //           height: 40,
  //         )
  //         // // Slider(
  //         //   value: 0.5,
  //         //   onChanged: (value) {},
  //         // )
  //       ],
  //     ),);
  //
  //   },);
  // }
}
// Scaffold//
/*
* Scaffold(
      appBar: AppBar(
        title: const Text("Media_Bossterß"),
      ),
      body: Column(
        children: [
          CarouselSlider.builder(
              itemCount: imageCarsoul.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("${imageCarsoul[index]}"),
                          fit: BoxFit.fitWidth)),
                );
              },
              options: CarouselOptions(
                initialPage: imageCarsoul.length,
                autoPlay: true,
                height: 200,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  providerR!.changeIndex(index);
                  pageController = PageController(initialPage: index);
                },
              )),
          const SizedBox(
            height: 10,
          ),
          SmoothPageIndicator(
            controller: pageController,
            count: imageCarsoul.length,
          ),
          IconButton(
              onPressed: () {
                // assetsAudio.open(Audio("assets/audio/audio1.mp3"));
                // // assetsAudio.
                // providerW!.songRun(true);
                // providerW!.choice == true
                //      assetsAudio.play();
                //     : providerR!.assetsAudio.stop();
                // print(providerW!.choice);
              },
              icon:
                  // providerW!.choice == false
                  //     ?
                  const Icon(Icons.play_arrow)
              // : Icon(Icons.stop)
              ),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'music');
              },
              child: const Text("Music")),
          Expanded(
            child: ListView.builder(
              itemCount: mproviderW!.allMusic.length,
              itemBuilder: (context, index) {
              return  Column(
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.sizeOf(context).width,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: const BorderRadius.all(Radius.circular(10))),
                      child: ListTile(
                        leading: Image.network("${mproviderR!.allMusic[index].image}"),
                        title: Text("${mproviderR!.allMusic[index].title}"),
                        onTap: () {
                          mproviderR!.checkIndex(index);
                          Navigator.pushNamed(context, 'music');
                        },
                      ),
                    ),
                    const Divider(),

                  ],
                );
              },
            ),
          )
        ],
      ),
    );*/
