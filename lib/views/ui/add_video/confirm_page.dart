import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';

class ConfirmPage extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  ConfirmPage({Key? key, required this.videoFile, required this.videoPath})
    : super(key: key);

  @override
  State<ConfirmPage> createState() => _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {
  late VideoPlayerController controller;
  TextEditingController songController = TextEditingController();
  TextEditingController captionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(widget.videoFile);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.0.h),
            SizedBox(
              width: 1.sw,
              height: 0.67.sh,
              child: VideoPlayer(controller),
            ),

            SizedBox(height: 30.0.h),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: 1.sw - 20.w,
                    child: TextInputField(
                      controller: songController,
                      labelText: "Song Name",
                      icon: Icons.music_note,
                    ),
                  ),
                  SizedBox(height: 10.0.h),

                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: 1.sw - 20.w,
                    child: TextInputField(
                      controller: captionController,
                      labelText: "Caption",
                      icon: Icons.closed_caption,
                    ),
                  ),
                  SizedBox(height: 10.0.h),

                  ElevatedButton(onPressed: () {

                  }, 
                  child: Text(
                    "share",
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      color: Colors.white
                    ),
                  ))

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
