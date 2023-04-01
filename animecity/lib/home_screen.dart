import "package:chewie/chewie.dart";
import "package:flutter/material.dart";
import "package:video_player/video_player.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.videoPlayerController}) : super(key: key);
  final VideoPlayerController videoPlayerController;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ChewieController chewieController;

  @override
  void initState() {
    chewieController = ChewieController(videoPlayerController: widget.videoPlayerController,placeholder: Center(child: Text('Loading Video')));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
      Center(
        // child: Chewie(controller: chewieController),
        child: Image.network('https://drive.google.com/uc?export=download&id=1R_C1lsuXltXJOtJZAPhjFpnKYV_Y2lzD'),
      ),
    );
  }
}