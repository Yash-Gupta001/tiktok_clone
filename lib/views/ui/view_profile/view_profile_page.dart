import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/controllers/profile/view_profile_controller.dart';

class ViewProfilePage extends StatefulWidget {
  final String uid;
  const ViewProfilePage({super.key, required this.uid});

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  final ViewProfileController viewprofileController = Get.put(
    ViewProfileController(),
  );

  @override
  void initState() {
    super.initState();
    viewprofileController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewProfileController>(
      init: ViewProfileController(),
      builder: (controller) {
        if(controller.user.isEmpty){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: Icon(Icons.person_add_alt_1_outlined),
            actions: [Icon(Icons.more_horiz)],
            title: Text(
              controller.user['name'],
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: '',
                            // imageUrl: controller.user['profilePhoto'],
                            height: 100.0.h,
                            width: 100.0.w,
                            placeholder:
                                (context, url) => CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(Icons.error),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text(
                              controller.user['following'],
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'following',
                              style: TextStyle(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          color: Colors.black54,
                          width: 1,
                          height: 15.0.h,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                        ),
        
                        Column(
                          children: [
                            Text(
                              controller.user['followers'],
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'followers',
                              style: TextStyle(
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
        
                        Container(
                          color: Colors.black54,
                          width: 1,
                          height: 15.0.h,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        Column(
                          children: [
                            Text(
                              controller.user['likes'],
                              style: TextStyle(
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('likes', style: TextStyle(fontSize: 14.0.sp)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0.h),
                    Container(
                      width: 140.0.w,
                      height: 47.0.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            if (widget.uid == authController.user.uid) {
                              authController.signOut();
                            } else {
                              controller.followUser();
                            }
                          },
                          child: Text(
                            widget.uid == authController.user.uid
                                ? 'Sign Out'
                                : controller.user['isFollowing']
                                ? 'Unfollow'
                                : 'Follow',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.0.h),
                    
                    /// List of videos
                    GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (context, index) {
                        String thumbnail = controller.user['thumbnails'][index];
                        return CachedNetworkImage(
                          imageUrl: thumbnail,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
