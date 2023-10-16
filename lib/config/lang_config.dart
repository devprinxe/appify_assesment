import 'package:get/get.dart';

import 'bn.dart';
import 'en.dart';

class LangConfig extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': engLangMap,
    'bn_BD': bnLangMap,
  };
}