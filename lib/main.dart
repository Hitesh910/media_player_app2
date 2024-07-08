import 'package:flutter/material.dart';
import 'package:media_bosster_app/screen/componet/network/provider/internet_provider.dart';
import 'package:media_bosster_app/screen/home/provider/home_provider.dart';
import 'package:media_bosster_app/screen/provider/music_provider.dart';
import 'package:media_bosster_app/screen/video/provider/video_provider.dart';
import 'package:media_bosster_app/utils/app_routes.dart';
import 'package:media_bosster_app/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: HomeProvider()),
      ChangeNotifierProvider.value(value: MusicProvider()),
      ChangeNotifierProvider.value(value: VideoProvider()),
      ChangeNotifierProvider.value(value: InternetProvider()..checkInternet()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      // themeMode: ThemeMode.dark,
      routes: app_routes,
    ),
  )
      // MaterialApp(
      //   routes: app_routes,
      // ),
      );
}
