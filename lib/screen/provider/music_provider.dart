import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/home/provider/home_provider.dart';
import 'package:media_bosster_app/screen/music/model/music_model.dart';

class MusicProvider with ChangeNotifier {
  AssetsAudioPlayer assetsAudio = AssetsAudioPlayer();
  bool isPlay = true;
  Duration endDuration = Duration(seconds: 0);
  Duration currentDuration = Duration(seconds: 0);
  int index = 0;
  int sIndex = 0;
  HomeProvider? provider = HomeProvider();
  int aIndex= 0;


  // int? nIndex =0;
  List<String> imageAlbum = [
    "https://c.saavncdn.com/editorial/PopMeinTop_20240701103058_150x150.jpg",
    "https://c.saavncdn.com/505/Husn-Irani-From-Wild-Wild-Punjab-Hindi-2024-20240627151003-150x150.jpg",
    "https://c.saavncdn.com/editorial/Hindi-IndiaSuperhitsTop50_20240705025241_150x150.jpg",
      "https://m.media-amazon.com/images/I/81yLdtaqhpL._UF1000,1000_QL80_.jpg",
  ];

  List<List<MusicModel>> allList = [
    [
      MusicModel(
          image:
              "https://pagalfree.com/images/128Angaaron%20-%20Pushpa%202%20The%20Rule%20128%20Kbps.jpg",
          song:
              "https://pagalfree.com/musics/128-Angaaron - Pushpa 2 The Rule 128 Kbps.mp3",
          title: "Angaaron"),
      MusicModel(
          image:
              "https://pagalfree.com/images/128Suniyan%20Suniyan%20-%20Juss%20128%20Kbps.jpg",
          song:
              "https://pagalfree.com/musics/128-Suniyan%20Suniyan%20-%20Juss%20128%20Kbps.mp3",
          title: "Suniyan Suniyan"),
      MusicModel(
          image:
              "https://pagalfree.com/images/128Rishte%20Naate%20-%20De%20Dana%20Dan%20128%20Kbps.jpg",
          song:
              "https://pagalfree.com/musics/128-Rishte%20Naate%20-%20De%20Dana%20Dan%20128%20Kbps.mp3",
          title: "Rishte natte"),
      MusicModel(
          image:
              "https://pagalfree.com/images/128Raanjhanaa%20-%20Raanjhanaa%20128%20Kbps.jpg",
          song:
              "https://pagalfree.com/musics/128-Raanjhanaa - Raanjhanaa 128 Kbps.mp3",
          title: "Raanjhanaa"),
      MusicModel(
          image:
              "https://pagalfree.com/images/128Banthan%20-%20Kurukshetra%20128%20Kbps.jpg",
          song:
              "https://pagalfree.com/musics/128-Banthan - Kurukshetra 128 Kbps.mp3",
          title: "Banthan"),
    ],
    [
      MusicModel(image: "https://pagalfree.com/images/128295%20-%20Moosetape%20128%20Kbps.jpg",song: "https://pagalfree.com/musics/128-295 - Moosetape 128 Kbps.mp3",title: "295"),
      MusicModel(image: "https://pagalfree.com/images/128Bad - Sidhu Moose Wala 128 Kbps.jpg",song: "https://pagalfree.com/musics/128-Bad - Sidhu Moose Wala 128 Kbps.mp3",title: "Bad"),
      MusicModel(image: "https://pagalfree.com/images/128Arjan Vailly - Animal 128 Kbps.jpg",song: "https://pagalfree.com/musics/128-Arjan Vailly - Animal 128 Kbps.mp3",title: "Arjan Vailay"),
      MusicModel(image: "https://pagalfree.com/images/1282 Jatt - Shinda 128 Kbps.jpg",song: "https://pagalfree.com/musics/128-2 Jatt - Shinda 128 Kbps.mp3",title: "2 Jatt")
    ],
    [
      MusicModel(
          image:
          "https://pagalfree.com/images/128Agar%20Ho%20Tum%20-%20Mr.%20And%20Mrs.%20Mahi%20128%20Kbps.jpg",
          song:
          "https://pagalfree.com/musics/128-Agar Ho Tum - Mr. And Mrs. Mahi 128 Kbps.mp3",
          title: "Agar Tum Sath ho"),
      MusicModel(
          image:
          "https://pagalfree.com/images/128Zindagi%20Tere%20Naam%20-%20Yodha%20128%20Kbps.jpg",
          song:
          "https://pagalfree.com/musics/128-Zindagi Tere Naam - Yodha 128 Kbps.mp3",
          title: "Tere naam"),
      MusicModel(
          image:
          "https://pagalfree.com/images/128Main Yaad Aaunga - Stebin Ben 128 Kbps.jpg",
          song:
          "https://pagalfree.com/musics/128-Main Yaad Aaunga - Stebin Ben 128 Kbps.mp3",
          title: "Main yadd Aaaunga"),
      MusicModel(
          image:
          "https://pagalfree.com/images/128Khudaya - Sarfira 128 Kbps.jpg",
          song:
          "https://pagalfree.com/musics/128-Khudaya - Sarfira 128 Kbps.mp3",
          title: "Khudya"),
    ],
    [
      MusicModel(image: "https://pagalfree.com/images/128Aa Bhi Ja O Piya - Title Track - Aa Bhi Ja O Piya 128 Kbps.jpg",song: "https://pagalfree.com/musics/128-Dil Mein Thee - Aa Bhi Ja O Piya 128 Kbps.mp3",title: "Dil mein thee"),
      MusicModel(
          image:
          "https://pagalfree.com/images/128Suniyan%20Suniyan%20-%20Juss%20128%20Kbps.jpg",
          song:
          "https://pagalfree.com/musics/128-Suniyan%20Suniyan%20-%20Juss%20128%20Kbps.mp3",
          title: "Suniyan Suniyan"),
      MusicModel(
          image:
          "https://pagalfree.com/images/128Main Yaad Aaunga - Stebin Ben 128 Kbps.jpg",
          song:
          "https://pagalfree.com/musics/128-Main Yaad Aaunga - Stebin Ben 128 Kbps.mp3",
          title: "Main yadd Aaaunga"),
      MusicModel(
          image:
          "https://pagalfree.com/images/128Khudaya - Sarfira 128 Kbps.jpg",
          song:
          "https://pagalfree.com/musics/128-Khudaya - Sarfira 128 Kbps.mp3",
          title: "Khudya"),



    ]
  ];

  // List<MusicModel> allMusic = [
  //   MusicModel(
  //       image:
  //           "https://pagalfree.com/images/128Angaaron%20-%20Pushpa%202%20The%20Rule%20128%20Kbps.jpg",
  //       song:
  //           "https://pagalfree.com/musics/128-Angaaron - Pushpa 2 The Rule 128 Kbps.mp3",
  //       title: "Angaaron"),
  //   MusicModel(
  //       image:
  //           "https://pagalfree.com/images/128Suniyan%20Suniyan%20-%20Juss%20128%20Kbps.jpg",
  //       song:
  //           "https://pagalfree.com/musics/128-Suniyan%20Suniyan%20-%20Juss%20128%20Kbps.mp3",
  //       title: "Suniyan Suniyan"),
  //   MusicModel(
  //       image:
  //           "https://pagalfree.com/images/128Rishte%20Naate%20-%20De%20Dana%20Dan%20128%20Kbps.jpg",
  //       song:
  //           "https://pagalfree.com/musics/128-Rishte%20Naate%20-%20De%20Dana%20Dan%20128%20Kbps.mp3",
  //       title: "Rishte natte"),
  //   MusicModel(
  //       image:
  //           "https://pagalfree.com/images/128Raanjhanaa%20-%20Raanjhanaa%20128%20Kbps.jpg",
  //       song:
  //           "https://pagalfree.com/musics/128-Raanjhanaa - Raanjhanaa 128 Kbps.mp3",
  //       title: "Raanjhanaa"),
  //   MusicModel(
  //       image:
  //           "https://pagalfree.com/images/128Banthan%20-%20Kurukshetra%20128%20Kbps.jpg",
  //       song:
  //           "https://pagalfree.com/musics/128-Banthan - Kurukshetra 128 Kbps.mp3",
  //       title: "Banthan"),
  // ];
  //
  // List<MusicModel> album1 = [
  //   MusicModel(
  //       image:
  //           "https://pagalfree.com/images/128Agar%20Ho%20Tum%20-%20Mr.%20And%20Mrs.%20Mahi%20128%20Kbps.jpg",
  //       song:
  //           "https://pagalfree.com/musics/128-Agar Ho Tum - Mr. And Mrs. Mahi 128 Kbps.mp3",
  //       title: "Agar Tum Sath ho"),
  //   MusicModel(
  //       image:
  //           "https://pagalfree.com/images/128Zindagi%20Tere%20Naam%20-%20Yodha%20128%20Kbps.jpg",
  //       song:
  //           "https://pagalfree.com/musics/128-Zindagi Tere Naam - Yodha 128 Kbps.mp3",
  //       title: "Tere naam"),
  //   MusicModel(
  //       image:
  //           "https://pagalfree.com/images/128Main Yaad Aaunga - Stebin Ben 128 Kbps.jpg",
  //       song:
  //           "https://pagalfree.com/musics/128-Main Yaad Aaunga - Stebin Ben 128 Kbps.mp3",
  //       title: "Main yadd Aaaunga"),
  //   MusicModel(
  //       image: "https://pagalfree.com/images/128Khudaya - Sarfira 128 Kbps.jpg",
  //       song: "https://pagalfree.com/musics/128-Khudaya - Sarfira 128 Kbps.mp3",
  //       title: "Khudya")
  // ];

  List<String> Music = [
    "https://pagalfree.com/musics/128-Angaaron - Pushpa 2 The Rule 128 Kbps.mp3",
    "https://pagalfree.com/musics/128-Raanjhanaa - Raanjhanaa 128 Kbps.mp3",
    "https://pagalfree.com/musics/128-Banthan - Kurukshetra 128 Kbps.mp3",
    "https://pagalfree.com/musics/128-Suniyan%20Suniyan%20-%20Juss%20128%20Kbps.mp3",
  ];

  void initAudio() async {
    await assetsAudio.open(
        Playlist(
            startIndex: index,
            audios: allList[aIndex].map((e) => Audio.network(e.song!)).toList()),
        loopMode: LoopMode.playlist,
        autoStart: false,showNotification: true);
    endDurationSong();
    currentDurationSong();
    print(aIndex);

  }

  void plyAndPause() {

    if (isPlay) {
      assetsAudio.pause();
    } else {
      assetsAudio.play();
    }
    isPlay = !isPlay;

    notifyListeners();
  }

  void endDurationSong() {
    endDuration = assetsAudio.current.value!.audio.duration;
    notifyListeners();
  }

  void currentDurationSong() {
    assetsAudio.currentPosition.listen(
      (event) {
        currentDuration = event;
        notifyListeners();
      },
    );
  }

  void checkIndex(int value) {
    index = value;
    notifyListeners();
  }

  void songIndex(int value) {
    sIndex = value;
    notifyListeners();
  }

  void nextIndex(int value) {
    // nIndex = n;
    //nIndex++;
    if (index < allList[aIndex].length - 1) {
      index++;
    } else {
      index = 0;
    }

    notifyListeners();
  }

  void previousIndex(int value) {
    if (index > 0) {
      index--;
    } else {
      index = 0;
    }
    notifyListeners();
  }

  void albumIndex(int index)
  {
    aIndex = index;
    notifyListeners();
  }
}
