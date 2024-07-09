import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/music/view/music_screen.dart';
import 'package:media_bosster_app/screen/video%20load/view/video_load_screen.dart';
import 'package:media_bosster_app/screen/video/view/video_screen.dart';

import '../screen/home/view/home_screen.dart';

Map<String,WidgetBuilder> app_routes = {
  "/":(context) => HomeScreen(),
  "music":(context) => MusicScreen(),
  "video":(context) => VideoScreen(),
  "videoLoad":(context) => VideoLoadScreen(),
};