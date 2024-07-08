import 'package:flutter/material.dart';
class InternetWidget extends StatelessWidget {
  const InternetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.wifi_off,size: 200,),
        Text("Check your internet Connection",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),)
      ],
    ),);
  }
}
