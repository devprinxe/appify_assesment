import 'package:appify_book/models/post_model.dart';
import 'package:appify_book/utils/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lottie/lottie.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:reaction_askany/reaction_askany.dart';

import '../../utils/common_buttons.dart';
import '../../utils/constansts.dart';
import '../../utils/extensions.dart';
import '../../utils/theme.dart';
import '../utils/photo_grid.dart';
import 'home_screen_logic.dart';

class HomeScreenView extends StatelessWidget {
  HomeScreenView({super.key});

  final logic = Get.find<HomeScreenLogic>();
  final state = Get.find<HomeScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Appifybook",
                      style: getTextStyle(
                          20, FontWeight.bold, AppColors.colorPrimaryDark),
                    ),
                    const Spacer(),
                    CircleAvatar(
                      backgroundColor: AppColors.greyTextColor.withOpacity(0.2),
                      child: const Icon(
                        Icons.add,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.greyTextColor.withOpacity(0.2),
                      child: const Icon(
                        Icons.search,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.greyTextColor.withOpacity(0.2),
                      child: const Icon(
                        Icons.message_rounded,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppColors.colorPrimary,
                      backgroundImage: AssetImage("images/user.png"),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            builder: (_) {
                              return Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppTextField(
                                        textFieldType: TextFieldType.MULTILINE,
                                        controller: state.postController,
                                        maxLines: 5,
                                        decoration: const InputDecoration(
                                            hintText: "What\'s on your mind"),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Obx(() => CheckboxListTile(
                                          value: state.useBg.value,
                                          controlAffinity:
                                              ListTileControlAffinity.leading,
                                          title: Text("Use Background Image"),
                                          onChanged: (var val) {
                                            state.useBg.value = val!;
                                            state.addImage.value = false;
                                          })),
                                      Obx(() => Visibility(
                                            visible: !state.useBg.value,
                                            child: CheckboxListTile(
                                                value: state.addImage.value,
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .leading,
                                                title:
                                                    Text("Add Images in post"),
                                                onChanged: (var val) {
                                                  state.addImage.value = val!;
                                                }),
                                          )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                          onPressed: () {
                                            List<ReactionsModel> reactions = [];
                                            reactions.add(ReactionsModel(
                                                "Like", "images/like.json"));
                                            reactions.add(ReactionsModel(
                                                "wow", "images/wow.json"));
                                            reactions.add(ReactionsModel(
                                                "love", "images/love.json"));
                                            state.postList.value.add(PostModel(
                                                state.postController.text,
                                                state.useBg.value,
                                                state.addImage.value
                                                    ? state.urls
                                                    : null,
                                                reactions));
                                            state.postController.clear();
                                            finish(context);
                                          },
                                          child: Text("Add Post"))
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: SizedBox(
                        height: 80,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 100,
                          width: Get.width / 1.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border:
                                  Border.all(color: AppColors.borderBoxColor)),
                          child: Text(
                            "What\'s on your mind",
                            style: getTextStyle(
                                14, FontWeight.normal, AppColors.textColorFade),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Obx(() => ListView.builder(
                    itemCount: state.postList.value.length,
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (_, i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            leading: const CircleAvatar(
                              backgroundColor: AppColors.colorPrimary,
                              backgroundImage: AssetImage("images/user.png"),
                            ),
                            title: Text(
                              "Prince mahmud",
                              style: getTextStyle(18, FontWeight.bold,
                                  AppColors.textColorBlack),
                            ),
                            subtitle: Text(
                              "10 minutes ago",
                              style: getTextStyle(14, FontWeight.normal,
                                  AppColors.textColorFade),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.edit),
                                SizedBox(
                                  width: 10.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    state.postList.removeAt(i);
                                  },
                                  child: Icon(Icons.close),
                                ),
                                SizedBox(
                                  width: 10.0,
                                )
                              ],
                            ),
                          ),
                          state.postList[i].backgroundImage!
                              ? Container(
                                  height: 300,
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage("images/bg.jpg"),
                                          fit: BoxFit.cover)),
                                  child: Center(
                                    child: Text(
                                      state.postList.value[i].body!,
                                      style: getTextStyle(25, FontWeight.bold,
                                          AppColors.textColorBlack),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20.0),
                                  child: Text(
                                    state.postList.value[i].body!,
                                    style: getTextStyle(14, FontWeight.normal,
                                        AppColors.textColorBlack),
                                  ),
                                ),
                          Visibility(
                            visible: state.postList.value[i].image != null,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: PhotoGrid(
                                imageUrls: state.urls,
                                onImageClicked: (i) =>
                                    print('Image $i was clicked!'),
                                onExpandClicked: () =>
                                    print('Expand Image was clicked'),
                                maxImages: 4,
                              ),
                            ),
                          ),
                          Obx(() => GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (_) {
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Obx(() => ListView.builder(
                                                    itemCount: state
                                                        .postList
                                                        .value[i]
                                                        .comments
                                                        .value
                                                        .length,
                                                    physics:
                                                        NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemBuilder: (_, index) {
                                                      return Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                              "${state.postList.value[i].comments.value[index]}"),
                                                          GestureDetector(
                                                            onTap: () {
                                                              state
                                                                  .postList
                                                                  .value[i]
                                                                  .comments
                                                                  .value
                                                                  .removeAt(
                                                                      index);
                                                              state
                                                                  .postList
                                                                  .value[i]
                                                                  .comments
                                                                  .refresh();
                                                            },
                                                            child: Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    })),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                AppTextField(
                                                  textFieldType:
                                                      TextFieldType.MULTILINE,
                                                  controller:
                                                      state.commentController,
                                                  maxLines: 5,
                                                  decoration: const InputDecoration(
                                                      hintText:
                                                          "Write your comment"),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      state.postList.value[i]
                                                          .comment.value++;
                                                      state.postList.value[i]
                                                          .comments.value
                                                          .add(state
                                                              .commentController
                                                              .text);
                                                      state.commentController
                                                          .clear();
                                                      finish(context);
                                                    },
                                                    child: Text("Add Comment")),
                                              ],
                                            ),
                                          ),
                                        );
                                      });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                          "${state.postList[i].comments.length} comments")
                                    ],
                                  ),
                                ),
                              )),
                          Obx(() => Visibility(
                                visible: state.showReaction.value &&
                                    i == state.currentPostIndex.value,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                          left: 30.0,
                                          right: 30,
                                          top: 10,
                                          bottom: 10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.borderBoxColor),
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              state.postList.value[i]
                                                  .reactions![0].count.value++;
                                              state.showReaction.value =
                                                  !state.showReaction.value;
                                            },
                                            child: Lottie.asset(
                                                state.postList.value[i]
                                                    .reactions![0].image!,
                                                height: 40,
                                                width: 40),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              state.postList.value[i]
                                                  .reactions![1].count.value++;
                                              state.showReaction.value =
                                                  !state.showReaction.value;
                                            },
                                            child: Lottie.asset(
                                                state.postList.value[i]
                                                    .reactions![1].image!,
                                                height: 40,
                                                width: 40),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              state.postList.value[i]
                                                  .reactions![2].count.value++;
                                              state.showReaction.value =
                                                  !state.showReaction.value;
                                            },
                                            child: Lottie.asset(
                                                state.postList.value[i]
                                                    .reactions![2].image!,
                                                height: 40,
                                                width: 40),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, int indexR) {
                                return Row(
                                  children: [
                                    Lottie.asset(
                                        state.postList.value[i]
                                            .reactions![indexR].image!,
                                        height: 10,
                                        width: 10),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Obx(() => Text(state.postList.value[i]
                                        .reactions![indexR].count.value
                                        .toString())),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                );
                              },
                              itemCount:
                                  state.postList.value[i].reactions!.length,
                            ),
                          ),
                          Obx(() => Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        state.showReaction.value =
                                            !state.showReaction.value;
                                        state.currentPostIndex.value = i;
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.thumb_up,
                                            color: state.isLikes.value
                                                ? Colors.blueAccent
                                                : AppColors.textColorFade,
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            "Like",
                                            style: getTextStyle(
                                                14,
                                                FontWeight.bold,
                                                AppColors.textColorFade),
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (_) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(20.0),
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      bottom:
                                                          MediaQuery.of(context)
                                                              .viewInsets
                                                              .bottom),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Obx(() =>
                                                          ListView.builder(
                                                              itemCount: state
                                                                  .postList
                                                                  .value[i]
                                                                  .comments
                                                                  .value
                                                                  .length,
                                                              physics:
                                                                  NeverScrollableScrollPhysics(),
                                                              shrinkWrap: true,
                                                              itemBuilder:
                                                                  (_, index) {
                                                                return Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                        "${state.postList.value[i].comments.value[index]}"),
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        state
                                                                            .postList
                                                                            .value[i]
                                                                            .comments
                                                                            .value
                                                                            .removeAt(index);
                                                                        state
                                                                            .postList
                                                                            .value[i]
                                                                            .comments
                                                                            .refresh();
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .delete,
                                                                        color: Colors
                                                                            .red,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              })),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      AppTextField(
                                                        textFieldType:
                                                            TextFieldType
                                                                .MULTILINE,
                                                        controller: state
                                                            .commentController,
                                                        maxLines: 5,
                                                        decoration:
                                                            const InputDecoration(
                                                                hintText:
                                                                    "Write your comment"),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            state
                                                                .postList
                                                                .value[i]
                                                                .comment
                                                                .value++;
                                                            state
                                                                .postList
                                                                .value[i]
                                                                .comments
                                                                .value
                                                                .add(state
                                                                    .commentController
                                                                    .text);
                                                            state
                                                                .commentController
                                                                .clear();
                                                            finish(context);
                                                          },
                                                          child: Text(
                                                              "Add Comment")),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.mark_chat_unread_outlined),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          Text(
                                            "Comment",
                                            style: getTextStyle(
                                                14,
                                                FontWeight.bold,
                                                AppColors.textColorFade),
                                          )
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.share),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          "Share",
                                          style: getTextStyle(
                                              14,
                                              FontWeight.bold,
                                              AppColors.textColorFade),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      );
                    })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
