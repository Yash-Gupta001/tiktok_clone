import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/widgets/custom_icon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageidx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (idx){
          setState(() {
            pageidx = idx;
          });
        },
        backgroundColor: backgroundColor,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: pageidx,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30.0.sp),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 30.0.sp),
            label: 'Search',
          ),

          BottomNavigationBarItem(
            icon: CustomIcon(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message, size: 30.0.sp),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30.0.sp),
            label: 'Profile',
          ),
        ],
      ),
      body: pages[pageidx],
    );
  }
}
