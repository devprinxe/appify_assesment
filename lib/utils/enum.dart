enum DashBoardSateType { HOME, PACKAGE, HEALTH, MORE }

enum PackageOptions { VIDEO_CALL, AUDIO_CALL, CHAT }

enum DeviceCheckingOptions {
  INIT,
  NETWORK_TEST,
  PERMISSION_CHECK,
  REDIRECT,
  POLICIES
}

enum ChatUserType { BOT, PERSON }

enum ChatParticipantType { SENDER, RECEIVER }

enum ChatCurrentSession { NEW, CONNECTED, RUNNING, COMPLETED }

enum ChatCurrentStatus { PENDING, LIVE, BLOCK, CLOSED, REJOIN }

enum ContentNature { Static, Dynamic }

enum DeepLinkType { Link, Id, Alias, Key }

enum WidgetCategory {
  SERVICE,
  ADS,
  DOCTOR_CATEGORY,
  POPULAR_DOCTOR_PROFILE,
  PACKAGES,
  PROMOTIONAL_ADS,
  OTHERS
}

enum WidgetContentType {
  SERVICE,
  PACKAGE,
  DOCTOR,
  HEALTH_PRODUCT,
  MEDICINE,
  INTERNAL_PAGE,
  EXTERNAL_PAGE,
  AUDIO,
  VIDEO,
  TEXT_CHAT,
  BOOK_SPECIALIST,
  MY_HEALTH
}

enum OrderStatusHistory { Pending, Confirmed, Delivered, Cancelled }

extension PackageOptionsExtension on PackageOptions {
  String? get name {
    switch (this) {
      case PackageOptions.VIDEO_CALL:
        return 'Video Call';
      case PackageOptions.AUDIO_CALL:
        return 'Audio Call';
      case PackageOptions.CHAT:
        return 'Chat';
      default:
        return null;
    }
  }
}

extension ChatUserTypeString on String {
  ChatUserType get toChatUserTypeEnum {
    switch (this) {
      case "BOT":
        return ChatUserType.BOT;
      case "PERSON":
        return ChatUserType.PERSON;
      default:
        return ChatUserType.PERSON;
    }
  }
}
