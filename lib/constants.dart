import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/views/controllers/auth/auth_controller.dart';
import 'package:tiktok_clone/views/ui/add_video/add_video_page.dart';
import 'package:tiktok_clone/views/ui/video/video_page.dart';

/// pages
List pages = [
  VideoPage(),
  Text('Search Screen'),
  AddVideoPage(),
  Text('Message Screen'),
  Text('Profile Screen'),
];


/// colors
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;


///  firebase related
var firebaseauth = FirebaseAuth.instance;
var firebasestorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;


/// Controllers
var authController = AuthController.instance;