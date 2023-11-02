import 'dart:convert';

import 'package:appify_book/models/post_model.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../utils/button_global.dart';
import '../../utils/extensions.dart';
import 'home_screen_state.dart';

class HomeScreenLogic extends GetxController {
  final state = HomeScreenState();

  @override
  void onInit() {
    getVideo();
    super.onInit();
  }

  void getVideo() {
    state.betterPlayerController.value = BetterPlayerController(
        BetterPlayerConfiguration(
            aspectRatio: 16 / 9,
            fit: BoxFit.contain,
            controlsConfiguration: BetterPlayerControlsConfiguration(
                showControls: true,),
            autoPlay: true),
        betterPlayerDataSource: BetterPlayerDataSource(
          BetterPlayerDataSourceType.network,
          "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
        ));
  }
}
