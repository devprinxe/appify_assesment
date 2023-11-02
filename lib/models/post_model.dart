import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PostModel {
  String? body;
  List<ReactionsModel>? reactions;
  var comment = 0.obs;
  var comments = <CommentsModel>[].obs;

  PostModel(this.body, this.reactions);
}

class ReactionsModel {
  String? name;
  IconData? image;
  var count = 0.obs;

  ReactionsModel(this.name, this.image);
}

class CommentsModel {
  String? body;
  var replies = <String>[].obs;
  List<ReactionsModel>? reactions;

  CommentsModel(this.body, this.reactions);
}
