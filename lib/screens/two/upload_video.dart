import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({super.key});

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

class _UploadVideoState extends State<UploadVideo> {
  XFile? selectedvideo;
  VideoPlayerController? _controller;
  Future<void> _uploadvideo() async {
    XFile? pickedvide0 = await ImagePicker().pickVideo(
      source: ImageSource.gallery,
    );
    if (pickedvide0 != null) {
      _controller = VideoPlayerController.file(File(pickedvide0.path));
      await _controller!.initialize();
    }
    setState(() {
      selectedvideo = pickedvide0;
    });
    _controller!.play();
    _controller!.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 70),
              Container(
                width: double.infinity,
                height: 400,
                child: _controller != null && _controller!.value.isInitialized
                    ? ClipRRect(
                        child: AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        ),
                      )
                    : Icon(Icons.video_call_sharp),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  _uploadvideo();
                },
                child: Text(
                  "Upload Video",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
