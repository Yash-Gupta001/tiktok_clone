import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  final Color leftColor;
  final Color rightColor;
  final IconData icon;
  final Color iconColor;
  final double size;

  const CustomIcon({
    super.key,
    this.leftColor = const Color(0xFFF82D64),
    this.rightColor = const Color(0xFF20D3EA),
    this.icon = Icons.add,
    this.iconColor = Colors.black,
    this.size = 45.0,
  });

  @override
  Widget build(BuildContext context) {
    final double iconSize = size.w;
    final double iconHeight = 30.0.h;
    final double layerOffset = 6.0.w;

    return SizedBox(
      width: iconSize,
      height: iconHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: iconSize - layerOffset,
              height: iconHeight,
              decoration: BoxDecoration(
                color: leftColor,
                borderRadius: BorderRadius.circular(7.0.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: iconSize - layerOffset,
              height: iconHeight,
              decoration: BoxDecoration(
                color: rightColor,
                borderRadius: BorderRadius.circular(7.0.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(-2, 2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: iconSize - layerOffset,
            height: iconHeight,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(7.0.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: Icon(icon, color: iconColor, size: 20.0.sp),
            ),
          ),
        ],
      ),
    );
  }
}
