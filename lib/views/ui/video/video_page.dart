import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/controllers/video/video_controller.dart';
import 'package:tiktok_clone/views/ui/comment/comment_page.dart';
import 'package:tiktok_clone/views/widgets/circle_animation.dart';
import 'package:tiktok_clone/views/widgets/video_player_item.dart';

class VideoPage extends StatelessWidget {
  VideoPage({super.key});

  final VideoController videoController = Get.put(VideoController());

  buildProfile(String profilePhoto) {
    return SizedBox(
      width: 60.0.w,
      height: 60.0.h,
      child: Stack(
        children: [
          Positioned(
            left: 5,
            child: Container(
              width: 50.0.w,
              height: 50.0.h,
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25.0.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0.r),
                child: Image(
                  image: NetworkImage(profilePhoto),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  buildMusicAlbum(String profilePhoto) {
    return SizedBox(
      width: 60.0.w,
      height: 60.0.h,
      child: Container(
        padding: EdgeInsets.all(11),
        height: 50.0.h,
        width: 50.0.w,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.grey, Colors.white]),
          borderRadius: BorderRadius.circular(25.0.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25.0.r),
          child: Image(image: NetworkImage(profilePhoto), fit: BoxFit.cover),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
          itemCount: videoController.videoList.length,
          controller: PageController(initialPage: 0, viewportFraction: 1),
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final data = videoController.videoList[index];
            return Stack(
              children: [
                VideoPlayerItem(videoUrl: data.videoUrl),
                Column(
                  children: [
                    SizedBox(height: 100.0.h),
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    data.username,
                                    style: TextStyle(
                                      fontSize: 20.0.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    data.caption,
                                    style: TextStyle(
                                      fontSize: 15.0.sp,
                                      color: Colors.white,
                                    ),
                                  ),

                                  Row(
                                    children: [
                                      Icon(
                                        Icons.music_note,
                                        size: 15,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        data.songName,
                                        style: TextStyle(
                                          fontSize: 15.0.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100.0.w,
                      margin: EdgeInsets.only(top: size.height / 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildProfile(data.profilePhoto),
                          Column(
                            children: [
                              InkWell(
                                onTap: () => videoController.likeVideo(data.id),
                                child: Icon(
                                  Icons.favorite,
                                  size: 40.0.sp,
                                  color: data.likes.contains(authController.user.uid) ? Colors.red : Colors.white,
                                ),
                              ),
                              SizedBox(height: 7.0.h),
                              Text(
                                data.likes.length.toString(),
                                style: TextStyle(
                                  fontSize: 20.0.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(CommentPage(id: data.id));
                                },
                                child: Icon(
                                  Icons.comment,
                                  size: 40.0.sp,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(height: 7.0.h),
                              Text(
                                data.commentCount.toString(),
                                style: TextStyle(
                                  fontSize: 20.0.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.reply,
                                  size: 40.0.sp,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(height: 7.0.h),
                              Text(
                                data.shareCount.toString(),
                                style: TextStyle(
                                  fontSize: 20.0.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                CircleAnimation(child: buildMusicAlbum(data.profilePhoto)),
              ],
            );
          },
        );
      }),
    );
  }
}
