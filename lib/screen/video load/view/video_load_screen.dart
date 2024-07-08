import 'package:flutter/material.dart';
class VideoLoadScreen extends StatefulWidget {
  const VideoLoadScreen({super.key});

  @override
  State<VideoLoadScreen> createState() => _VideoLoadScreenState();
}

class _VideoLoadScreenState extends State<VideoLoadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body: Column(children: [
      Center(child: Text("Video"),)
    ],),);
  }
}
