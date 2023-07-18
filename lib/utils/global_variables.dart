import 'package:flutter/material.dart';
import 'package:socializz/screens/add_post_screen.dart';
import 'package:socializz/screens/feed_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  Text("search"),
  AddPostScreen(),
  Text("notifications"),
  Text("profile"),
];