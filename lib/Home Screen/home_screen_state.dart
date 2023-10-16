import 'package:appify_book/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../client/base_state.dart';

class HomeScreenState extends BaseState {
  TextEditingController postController = TextEditingController();
  var isBalanceShow = false.obs;
  final TextEditingController commentController = TextEditingController();

  var isLikes = false.obs;
  var showReaction = false.obs;
  var useBg = false.obs;
  var addImage = false.obs;
  var currentPostIndex = 0.obs;

  var postList = <PostModel>[].obs;

  var urls = <String>[
    'images/imag1.jpg',
    'images/image2.jpg',
    'images/image3.jpg',
    'images/image4.jpg',
    'images/image5.jpg',
    'images/image6.jpg',
  ];
}
