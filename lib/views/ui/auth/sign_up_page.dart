import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/ui/auth/login_page.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _usernamecontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tik Tok Clone',
              style: TextStyle(
                fontSize: 35.0.sp,
                color: buttonColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            Text(
              'Register',
              style: TextStyle(fontSize: 25.0.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 25.0.h),
            Stack(
              children: [
                CircleAvatar(
                  radius: 64.0.r,
                  backgroundImage: AssetImage('assets/images/user.png'),
                  backgroundColor: Colors.black,
                ),
                Positioned(
                  bottom: -10,
                  left: 80,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add_a_photo),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0.h),
            Container(
              width: 1.sw,
              margin: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: TextInputField(
                controller: _usernamecontroller,
                labelText: 'Username',
                icon: Icons.person,
              ),
            ),

            SizedBox(height: 15.0.h),

            Container(
              width: 1.sw,
              margin: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: TextInputField(
                controller: _emailcontroller,
                labelText: 'Email',
                icon: Icons.email,
              ),
            ),
            SizedBox(height: 15.0.h),
            Container(
              width: 1.sw,
              margin: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: TextInputField(
                controller: _passwordcontroller,
                labelText: 'Password',
                icon: Icons.password,
              ),
            ),
            SizedBox(height: 30.0.h),
            Container(
              width: 1.sw - 40.w,
              height: 50.0.h,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.all(Radius.circular(5.0.r)),
              ),
              child: InkWell(
                onTap: () {
                  // Get.offAll(page)
                },
                child: Center(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 15.0.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(fontSize: 20.0.sp),
                ),
                InkWell(
                  onTap: () {
                    Get.to(LoginPage());
                  },
                  child: Text("Login", style: TextStyle(fontSize: 20.0.sp)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
