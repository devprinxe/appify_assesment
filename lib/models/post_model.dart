import 'package:get/get.dart';

class PostModel {
  String? body;
  bool? backgroundImage;
  List<String>? image;
  List<ReactionsModel>? reactions;
  var comment = 0.obs;
  var comments = <String>[].obs;

  PostModel(this.body, this.backgroundImage, this.image, this.reactions);
}

class ReactionsModel {
  String? name;
  String? image;
  var count = 0.obs;

  ReactionsModel(this.name, this.image);
}
