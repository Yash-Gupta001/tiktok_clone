import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45.0.w,
      height: 30.0.h,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 30.0.w,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 45, 100),
              borderRadius: BorderRadius.circular(7.0.r),
            ),
          ),

          Container(
            margin: EdgeInsets.only(right: 10),
            width: 30.0.w,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 32, 211, 234),
              borderRadius: BorderRadius.circular(7.0.r),
            ),
          ),

          Center(
            child: Container(
              height: double.infinity,
              width: 30.0.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7.0.r),
              ),
              child: Icon(Icons.add, color: Colors.black, size: 20.0.sp),
            ),
          ),
        ],
      ),
    );
  }
}
