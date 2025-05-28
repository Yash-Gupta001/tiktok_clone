import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/ui/add_video/confirm_page.dart';

class AddVideoPage extends StatelessWidget {
  const AddVideoPage({super.key});

  pickVideo(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.to(() => ConfirmPage(
        videoFile: File(video.path), 
        videoPath: video.path,
      ));
    } else {}
  }

  showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder:
          (context) => SimpleDialog(
            children: [
              SimpleDialogOption(
                onPressed: () => pickVideo(ImageSource.gallery, context),
                child: Row(
                  children: [
                    Icon(Icons.image),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        'Gallery',
                        style: TextStyle(fontSize: 20.0.sp),
                      ),
                    ),
                  ],
                ),
              ),

              ///
              SimpleDialogOption(
                onPressed: () => pickVideo(ImageSource.camera, context),
                child: Row(
                  children: [
                    Icon(Icons.camera),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        'Camera',
                        style: TextStyle(fontSize: 20.0.sp),
                      ),
                    ),
                  ],
                ),
              ),

              /// cancle button
              SimpleDialogOption(
                onPressed: () => Get.back(),
                child: Row(
                  children: [
                    Icon(Icons.cancel),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        'Cancle',
                        style: TextStyle(fontSize: 20.0.sp),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => showOptionsDialog(context),
          child: Container(
            width: 190.0.w,
            height: 50.0.h,
            decoration: BoxDecoration(color: buttonColor),
            child: Center(
              child: Text(
                "Add Video",
                style: TextStyle(
                  fontSize: 20.0.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
