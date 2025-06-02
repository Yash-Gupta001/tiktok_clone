import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/data/model/user.dart';
import 'package:tiktok_clone/views/controllers/search/search_controller.dart';
import 'package:tiktok_clone/views/ui/view_profile/view_profile_page.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  final SearchUserController searchUserController = Get.put(SearchUserController());

  @override
  Widget build(BuildContext context) {
    
    return Obx( () =>
     Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TextFormField(
            decoration: InputDecoration(
              filled: false,
              hintText: 'Search',
              hintStyle: TextStyle(
                fontSize: 18.0.sp,
                color: Colors.white
              )
            ),
            onFieldSubmitted: (value) => searchUserController.searchUser(value),
          ),
        ),
      
        body: searchUserController.searchedUsers.isEmpty ? Center(
          child: Text(
            'Search for user',
            style: TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ) : 
        ListView.builder(
          itemCount: searchUserController.searchedUsers.length,
          itemBuilder: (context, index){
            User user = searchUserController.searchedUsers[index];
            InkWell(
              onTap: () => Get.to(ViewProfilePage(uid: user.uid)),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.profilePhoto),
                ),
                title: Text(
                  user.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0.sp
                  ),
                ),
              ),
            );
          })
      ),
    );
  }
}