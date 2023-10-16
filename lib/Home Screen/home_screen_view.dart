import 'package:appify_book/utils/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:lottie/lottie.dart';
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
                    Spacer(),
                    CircleAvatar(
                      backgroundColor: AppColors.greyTextColor.withOpacity(0.2),
                      child: Icon(
                        Icons.add,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.greyTextColor.withOpacity(0.2),
                      child: Icon(
                        Icons.search,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.greyTextColor.withOpacity(0.2),
                      child: Icon(
                        Icons.message_rounded,
                        color: AppColors.textColorBlack,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.colorPrimary,
                      backgroundImage: AssetImage("images/user.png"),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    SizedBox(
                      height: 150,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 100,
                            width: context.width / 1.5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: AppColors.borderBoxColor)),
                            child: Text(
                              "What\'s on your mind",
                              style: getTextStyle(14, FontWeight.normal,
                                  AppColors.textColorFade),
                            ),
                          ),
                          ElevatedButton(onPressed: () {}, child: Text("Post"))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Icon(
                      Icons.photo,
                      color: AppColors.colorPrimary,
                      size: 35,
                    )
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: [
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: AppColors.colorPrimary,
                        backgroundImage: AssetImage("images/user.png"),
                      ),
                      title: Text(
                        "Prince mahmud",
                        style: getTextStyle(
                            18, FontWeight.bold, AppColors.textColorBlack),
                      ),
                      subtitle: Text(
                        "10 minutes ago",
                        style: getTextStyle(
                            14, FontWeight.normal, AppColors.textColorFade),
                      ),
                      trailing: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.more_horiz),
                          SizedBox(
                            width: 10.0,
                          ),
                          Icon(Icons.close),
                          SizedBox(
                            width: 10.0,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Text(
                        "Hi there, i visited a new place today. Hope this pictures will give you a good idea about the place",
                        style: getTextStyle(
                            14, FontWeight.normal, AppColors.textColorBlack),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: PhotoGrid(
                        imageUrls: state.urls,
                        onImageClicked: (i) => print('Image $i was clicked!'),
                        onExpandClicked: () =>
                            print('Expand Image was clicked'),
                        maxImages: 4,
                      ),
                    ),
                    Obx(() => Visibility(
                          visible: state.showReaction.value,
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 30.0, right: 30, top: 10, bottom: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.borderBoxColor),
                                  borderRadius: BorderRadius.circular(50.0),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    state.showReaction.value =
                                        !state.showReaction.value;
                                    state.isLikes.value = !state.isLikes.value;
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Lottie.asset("images/like.json",
                                          height: 40, width: 40),
                                      Lottie.asset("images/love.json",
                                          height: 40, width: 40),
                                      Lottie.asset("images/wow.json",
                                          height: 40, width: 40),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Obx(() => Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onLongPress: () {
                                  state.showReaction.value =
                                      !state.showReaction.value;
                                },
                                onTap: () {
                                  state.isLikes.value = !state.isLikes.value;
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.thumb_up,
                                      color: state.isLikes.value
                                          ? Colors.blueAccent
                                          : AppColors.textColorFade,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "Like",
                                      style: getTextStyle(14, FontWeight.bold,
                                          AppColors.textColorFade),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  Icon(Icons.mark_chat_unread_outlined),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Comment",
                                    style: getTextStyle(14, FontWeight.bold,
                                        AppColors.textColorFade),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.share),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "Share",
                                    style: getTextStyle(14, FontWeight.bold,
                                        AppColors.textColorFade),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
