import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void debugPrint(String? data) {
  if (kDebugMode) {
    print(data);
  }
}

extension MapWithIndex<T> on List<T> {
  List<R> mapWithIndex<R>(R Function(T, int i) callback) {
    List<R> result = [];
    for (int i = 0; i < this.length; i++) {
      R item = callback(this[i], i);
      result.add(item);
    }
    return result;
  }
}

const kButtonDecoration = BoxDecoration(
  gradient: LinearGradient(
      colors: [
        AppColors.colorPrimary,
        AppColors.colorPrimaryDark,
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);
