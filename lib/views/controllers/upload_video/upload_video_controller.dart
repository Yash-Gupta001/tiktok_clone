import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';
import 'package:tiktok_clone/constants.dart';

class UploadVideoController extends GetxController{

  /// to compress video
  _compressVideo(String videoPath){
    VideoCompress.compressVideo(videoPath, quality: VideoQuality.MediumQuality);
  }

  _uploadVideoToStorage(String id, String videoPath){
    Reference ref = firebasestorage.ref().child('videos').child(id);


    ref.putFile(_compressVideo(videoPath));
  }

  /// to upload video
  uploadvideo(String songName, String caption, String videopath) async{
    try{
      String uid =firebaseauth.currentUser!.uid;
      DocumentSnapshot userDoc = await firestore.collection("users").doc(uid).get();
      //get id
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;

      _uploadVideoToStorage("Video $len",videopath);
    }

    catch(e){
      print(e);
    }
  }
}