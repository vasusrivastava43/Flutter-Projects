import 'package:animecity/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp( MaterialApp(
    home: HomeScreen(videoPlayerController: VideoPlayerController.network('https://drive.google.com/uc?export=download&id=1HPyozP9gQQAvTO2mq5ZDbxicvhInr6eJ'),),
  ));
}