import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/views/ui/auth/sign_up_page.dart';
import 'package:tiktok_clone/views/widgets/text_input_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final TextEditingController _emailcontroller = TextEditingController();
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
              'Login',
              style: TextStyle(fontSize: 25.0.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 25.0.h),
            Container(
              width: 1.sw,
              margin: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: TextInputField(
                controller: _emailcontroller,
                labelText: 'Email',
                icon: Icons.email_rounded,
              ),
            ),
            SizedBox(height: 25.0.h),
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
                  authController.loginUser(_emailcontroller.text, _passwordcontroller.text);
                },
                child: Center(
                  child: Text(
                    "Login",
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
                  "Don't have an account? ",
                  style: TextStyle(fontSize: 20.0.sp),
                ),
                InkWell(
                  onTap: () {
                    Get.to(SignUpPage());
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20.0.sp),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
