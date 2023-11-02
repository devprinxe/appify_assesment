import 'package:appify_book/models/post_model.dart';
import 'package:appify_book/utils/text_style.dart';
import 'package:better_player/better_player.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'home_screen_logic.dart';

class HomeScreenView extends StatelessWidget {
  HomeScreenView({super.key});

  final logic = Get.find<HomeScreenLogic>();
  final state = Get.find<HomeScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Obx(() => Center(
                  child: Container(
                    height: Get.height,
                    width: Get.width,
                    color: Colors.black,
                    child: BetterPlayer(
                      controller: state.betterPlayerController.value,
                      key: state.betterPlayerKey,
                    ),
                  ),
                )),
            Obx(() => Visibility(
                visible: state.showMenu.value,
                child: Positioned(
                  bottom: 60,
                  right: 10.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: Get.width / 1.3,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: const Color(0xFFfa8989).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.white)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                InkWell(
                                  onTap: () {
                                    state.maxLineDesc.value = 3;
                                  },
                                  child: Visibility(
                                    visible: state.maxLineDesc.value > 5,
                                    child: const Text(
                                      "Less",
                                      style: TextStyle(
                                          color: Color(0xFFfa8989),
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Obx(() => Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                                  maxLines: state.maxLineDesc.value,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "29 Nov, 2023 @5:23pm",
                                  style: TextStyle(color: Color(0xFFfa8989)),
                                ),
                                InkWell(
                                  onTap: () {
                                    state.maxLineDesc.value = 10;
                                  },
                                  child: Visibility(
                                    visible: state.maxLineDesc.value < 5,
                                    child: const Text(
                                      "More",
                                      style: TextStyle(
                                          color: Color(0xFFfa8989),
                                          fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          const CircleAvatar(
                            radius: 20.0,
                            backgroundImage: AssetImage("images/imag1.jpg"),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Icon(
                            Icons.library_books_outlined,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20.0),
                                          topRight: Radius.circular(20.0))),
                                  builder: (context) {
                                    return Container(
                                      height: Get.height / 1.5,
                                      width: Get.width,
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20.0),
                                              topRight: Radius.circular(20.0))),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(10.0),
                                            decoration: const BoxDecoration(
                                                color: Colors.black26,
                                                borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(10.0),
                                                  bottomLeft:
                                                      Radius.circular(10.0),
                                                )),
                                            child: const Text(
                                              "45K Comments",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20.0,
                                          ),
                                          SizedBox(
                                            height: Get.height / 2,
                                            width: Get.width,
                                            child: ListView.builder(
                                              itemCount: 15,
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              itemBuilder: (_, i) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 10.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const CircleAvatar(
                                                        radius: 20.0,
                                                        backgroundImage: AssetImage(
                                                            "images/imag1.jpg"),
                                                      ),
                                                      const SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Row(
                                                            children: [
                                                              Text(
                                                                "James",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                              SizedBox(
                                                                width: 10.0,
                                                              ),
                                                              Text(
                                                                "@james",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .blueAccent),
                                                              ),
                                                              SizedBox(
                                                                width: 50.0,
                                                              ),
                                                              Text(
                                                                "2 Hours Ago",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10.0,
                                                          ),
                                                          const SizedBox(
                                                              width: 300,
                                                              child: Text(
                                                                "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
                                                                maxLines: 3,
                                                              )),
                                                          const SizedBox(
                                                            height: 10.0,
                                                          ),
                                                          Row(
                                                            children: [
                                                              InkWell(
                                                                onTap: () {
                                                                  showModalBottomSheet(
                                                                      shape: const RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(
                                                                                  20.0),
                                                                              topRight: Radius.circular(
                                                                                  20.0))),
                                                                      isScrollControlled:
                                                                          true,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (_) {
                                                                        return Container(
                                                                          height:
                                                                              Get.height / 1.5,
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              TimelineTile(
                                                                                isFirst: true,
                                                                                alignment: TimelineAlign.start,
                                                                                indicatorStyle: const IndicatorStyle(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    indicator: CircleAvatar(
                                                                                      backgroundImage: AssetImage("images/imag1.jpg"),
                                                                                    )),
                                                                                endChild: const Padding(
                                                                                  padding: EdgeInsets.only(left: 10.0),
                                                                                  child: Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        height: 40.0,
                                                                                      ),
                                                                                      Row(
                                                                                        children: [
                                                                                          Text(
                                                                                            "James",
                                                                                            style: TextStyle(color: Colors.black),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            width: 10.0,
                                                                                          ),
                                                                                          Text(
                                                                                            "@james",
                                                                                            style: TextStyle(color: Colors.blueAccent),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            width: 50.0,
                                                                                          ),
                                                                                          Text(
                                                                                            "2 Hours Ago",
                                                                                            style: TextStyle(color: Colors.grey),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      SizedBox(
                                                                                        height: 10.0,
                                                                                      ),
                                                                                      SizedBox(
                                                                                          width: 300,
                                                                                          child: Text(
                                                                                            "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
                                                                                            maxLines: 3,
                                                                                          )),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              TimelineTile(
                                                                                isLast: true,
                                                                                alignment: TimelineAlign.start,
                                                                                indicatorStyle: const IndicatorStyle(
                                                                                    height: 30,
                                                                                    width: 30,
                                                                                    indicator: CircleAvatar(
                                                                                      backgroundImage: AssetImage("images/imag1.jpg"),
                                                                                    )),
                                                                                endChild: Padding(
                                                                                  padding: const EdgeInsets.only(top: 10.0),
                                                                                  child: SizedBox(
                                                                                    width: 300,
                                                                                    height: 50,
                                                                                    child: AppTextField(
                                                                                      controller: state.commentReplyController,
                                                                                      textFieldType: TextFieldType.NAME,
                                                                                      decoration: InputDecoration(
                                                                                          enabledBorder: OutlineInputBorder(
                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                          ),
                                                                                          hintText: "Add Comment",
                                                                                          focusedBorder: OutlineInputBorder(
                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                          ),
                                                                                          border: OutlineInputBorder(
                                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                                          ),
                                                                                          prefixIcon: InkWell(
                                                                                            onTap: () {
                                                                                              state.showEmoji.value = !state.showEmoji.value;
                                                                                            },
                                                                                            child: const Icon(Icons.emoji_emotions_outlined),
                                                                                          ),
                                                                                          suffixIcon: const Icon(
                                                                                            Icons.send,
                                                                                            color: Colors.blueAccent,
                                                                                          )),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Obx(() => Visibility(
                                                                                    visible: state.showEmoji.value,
                                                                                    child: SizedBox(
                                                                                      height: 200,
                                                                                      child: EmojiPicker(
                                                                                        onEmojiSelected: (Category? category, Emoji emoji) {
                                                                                          // Do something when emoji is tapped (optional)
                                                                                        },
                                                                                        onBackspacePressed: () {
                                                                                          // Do something when the user taps the backspace button (optional)
                                                                                          // Set it to null to hide the Backspace-Button
                                                                                        },
                                                                                        // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
                                                                                        textEditingController: state.commentReplyController,
                                                                                        config: Config(
                                                                                          columns: 7,
                                                                                          emojiSizeMax: 32 * (foundation.defaultTargetPlatform == TargetPlatform.iOS ? 1.30 : 1.0),
                                                                                          // Issue: https://github.com/flutter/flutter/issues/28894
                                                                                          verticalSpacing: 0,
                                                                                          horizontalSpacing: 0,
                                                                                          gridPadding: EdgeInsets.zero,
                                                                                          initCategory: Category.RECENT,
                                                                                          bgColor: const Color(0xFFF2F2F2),
                                                                                          indicatorColor: Colors.blue,
                                                                                          iconColor: Colors.grey,
                                                                                          iconColorSelected: Colors.blue,
                                                                                          backspaceColor: Colors.blue,
                                                                                          skinToneDialogBgColor: Colors.white,
                                                                                          skinToneIndicatorColor: Colors.grey,
                                                                                          enableSkinTones: true,
                                                                                          recentTabBehavior: RecentTabBehavior.RECENT,
                                                                                          recentsLimit: 28,
                                                                                          noRecents: const Text(
                                                                                            'No Recents',
                                                                                            style: TextStyle(fontSize: 20, color: Colors.black26),
                                                                                            textAlign: TextAlign.center,
                                                                                          ),
                                                                                          // Needs to be const Widget
                                                                                          loadingIndicator: const SizedBox.shrink(),
                                                                                          // Needs to be const Widget
                                                                                          tabIndicatorAnimDuration: kTabScrollDuration,
                                                                                          categoryIcons: const CategoryIcons(),
                                                                                          buttonMode: ButtonMode.MATERIAL,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ))
                                                                            ],
                                                                          ),
                                                                        );
                                                                      });
                                                                },
                                                                child: const Icon(
                                                                    Icons
                                                                        .chat_bubble_outline),
                                                              ),
                                                              const SizedBox(
                                                                width: 4.0,
                                                              ),
                                                              const Text("45"),
                                                              const SizedBox(
                                                                width: 20.0,
                                                              ),
                                                              const Icon(Icons
                                                                  .favorite_border),
                                                              const SizedBox(
                                                                width: 4.0,
                                                              ),
                                                              const Text("12"),
                                                              const SizedBox(
                                                                width: 20.0,
                                                              ),
                                                              const Icon(Icons
                                                                  .flag_outlined),
                                                              const SizedBox(
                                                                width: 20.0,
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 10.0,
                                                          ),
                                                          Visibility(
                                                            visible: i % 2 == 0,
                                                            child: const Text(
                                                              "See 15 Replies",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 18),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          const Divider(),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const CircleAvatar(
                                                radius: 20.0,
                                                backgroundImage: AssetImage(
                                                    "images/imag1.jpg"),
                                              ),
                                              const SizedBox(
                                                width: 20.0,
                                              ),
                                              SizedBox(
                                                width: 300,
                                                child: AppTextField(
                                                  textFieldType:
                                                      TextFieldType.NAME,
                                                  decoration: InputDecoration(
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      hintText: "Add Comment",
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      prefixIcon: const Icon(Icons
                                                          .emoji_emotions_outlined),
                                                      suffixIcon: const Icon(
                                                        Icons.send,
                                                        color:
                                                            Colors.blueAccent,
                                                      )),
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  });
                            },
                            child: const Icon(
                              Icons.chat,
                              color: Colors.white,
                              size: 30.0,
                            ),
                          ),
                          const Text(
                            "45K",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          const Text(
                            "45K",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Icon(
                            Icons.share,
                            color: Colors.white,
                            size: 30.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          InkWell(
                            onTap: () {
                              state.showMenu.value = false;
                            },
                            child: Container(
                              height: 50,
                              width: 70,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(30.0),
                                    bottomLeft: Radius.circular(30.0),
                                  ),
                                  color:
                                      const Color(0xFFffdd5e).withOpacity(0.5)),
                              child: const Center(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios_outlined,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.arrow_back_ios,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    Icon(
                                      Icons.arrow_left_outlined,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))),
            Obx(() => Visibility(
                  visible: !state.showMenu.value,
                  child: Positioned(
                    bottom: 50,
                    left: 10.0,
                    child: InkWell(
                      onTap: () {
                        state.showMenu.value = true;
                      },
                      child: Container(
                        height: 50,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              bottomRight: Radius.circular(30.0),
                            ),
                            color: const Color(0xFFffdd5e).withOpacity(0.5)),
                        child: const Center(
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20,
                                color: Colors.white,
                              ),
                              Icon(
                                Icons.arrow_right_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
            Obx(
              () => Visibility(
                visible: state.showMenu.value,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: state.showDrawer.value? Container(
                    width: 250,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(onTap:(){
                              state.showDrawer.value = false;
                            },child: Icon(Icons.close,color: Colors.black,size: 30.0,)),
                          )],
                        ),
                        Row(
                          children: [
                            Icon(Icons.add,color: Colors.black,size: 30.0,),
                            SizedBox(width: 10.0,),
                            Text("Add Post",style: TextStyle(color: Colors.black,fontSize: 20.0),),
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          children: [
                            Icon(Icons.favorite,color: Colors.black,size: 30.0,),
                            SizedBox(width: 10.0,),
                            Text("View Your Likes",style: TextStyle(color: Colors.black,fontSize: 20.0),),
                          ],
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          children: [
                            Icon(Icons.dashboard_customize,color: Colors.black,size: 30.0,),
                            SizedBox(width: 10.0,),
                            Text("Scheduled post",style: TextStyle(color: Colors.black,fontSize: 20.0),),
                          ],
                        ),
                        SizedBox(height: 10.0,),
                      ]
                    )
                  ): InkWell(
                    onTap: (){
                      state.showDrawer.value = true;
                    },
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
