import 'package:appify_book/models/post_model.dart';
import 'package:appify_book/utils/text_style.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

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
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                            color: Color(0xFFfa8989).withOpacity(0.1),
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
                                    child: Text(
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
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                )),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "29 Nov, 2023 @5:23pm",
                                  style: TextStyle(color: Color(0xFFfa8989)),
                                ),
                                InkWell(
                                  onTap: () {
                                    state.maxLineDesc.value = 10;
                                  },
                                  child: Visibility(
                                    visible: state.maxLineDesc.value < 5,
                                    child: Text(
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
                          const Icon(
                            Icons.chat,
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
          ],
        ),
      ),
    );
  }
}
