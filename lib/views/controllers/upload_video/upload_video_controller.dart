import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tiktok_clone/data/model/video.dart';
import 'package:video_compress/video_compress.dart';
import 'package:tiktok_clone/constants.dart';

class UploadVideoController extends GetxController {
  /// to compress video
  _compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(
      videoPath,
      quality: VideoQuality.MediumQuality,
    );
    return compressedVideo!.file;
  }

  ///
  Future<String> _uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = firebasestorage.ref().child('videos').child(id);

    UploadTask uploadTask = ref.putFile(await _compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  ///
  _getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  ///
  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = firebasestorage.ref().child('thumbnails').child(id);

    UploadTask uploadTask = ref.putFile(await _getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  /// to upload video
  uploadvideo(String songName, String caption, String videopath) async {
    try {
      String uid = firebaseauth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection("users").doc(uid).get();
      //get id
      var allDocs = await firestore.collection('videos').get();

      int len = allDocs.docs.length;
      String videoUrl = await _uploadVideoToStorage("Video $len", videopath);
      String thumbnail = await _uploadImageToStorage("Video $len", videopath);

      Video video = Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "Video $len",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: songName,
        caption: caption,
        videoUrl: videoUrl,
        thumbnail: thumbnail,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profilePhoto'],
      );

      await firestore
          .collection('videos')
          .doc('Video $len')
          .set(video.toJson()
        );
      Get.back();
    } catch (e) {
      Get.snackbar('Error Uploading Video', e.toString());
      print(e);
    }
  }
}
