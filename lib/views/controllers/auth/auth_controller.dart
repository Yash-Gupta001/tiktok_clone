import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/constants.dart';
import 'package:tiktok_clone/data/model/user.dart' as model;
import 'package:tiktok_clone/views/ui/auth/login_page.dart';
import 'package:tiktok_clone/views/ui/bottomnavigation.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;
  late Rx<File?> _imagepicker;

  File? get profilePhoto => _imagepicker.value;
  User get user => _user.value!;

  @override
  void onReady(){
    super.onReady();
    _user = Rx<User?>(firebaseauth.currentUser);
    _user.bindStream(firebaseauth.authStateChanges());
    ever(_user, _setInitialScreen);
  }


  _setInitialScreen(User? user){
    if(user == null){
      Get.offAll( () => LoginPage());
    }
    else{
      Get.offAll( () => Bottomnavigation());
    }
  }

  /// funcion to pick image

  void pickImage() async {
    final imagepicker = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (imagepicker != null) {
      Get.snackbar(
        "Profile Picture",
        "You have successfully selected your profile picture",
      );
    }
    _imagepicker = Rx<File?>(File(imagepicker!.path));
  }

  /// upload to firebase storage

  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebasestorage
        .ref()
        .child('profilepics')
        .child(firebaseauth.currentUser!.uid);

    UploadTask uploadtask = ref.putFile(image);

    TaskSnapshot snap = await uploadtask;
    String downloadurl = await snap.ref.getDownloadURL();
    return downloadurl;
  }

  /// to register a user
  void registeruser(
    String username,
    String email,
    String password,
    File? image,
  ) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        /// save user to firebase

        UserCredential cred = await firebaseauth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String downloadUrl = await _uploadToStorage(image);

        model.User user = model.User(
          name: username,
          profilePhoto: downloadUrl,
          email: email,
          uid: cred.user!.uid,
        );

        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar('Error', 'Please enter all required fields');
      }
    } catch (e) {
      Get.snackbar("Error", "Creating account");
    }
  }

  /// to login user
  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseauth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        print("login successful");
      } else {
        Get.snackbar('Error', 'Please enter all required fields');
      }
    } catch (e) {
      Get.snackbar('login failed', e.toString());
    }
  }



}
