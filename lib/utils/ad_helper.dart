import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return kDebugMode
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-1807964973002727/7394195049';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return kDebugMode
          ? 'ca-app-pub-3940256099942544/1033173712'
          : 'ca-app-pub-1807964973002727/3338549902';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1033173712';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return '<YOUR_ANDROID_REWARDED_AD_UNIT_ID>';
    } else if (Platform.isIOS) {
      return '<YOUR_IOS_REWARDED_AD_UNIT_ID>';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static AdRequest get addRequest {
    return const AdRequest(
      keywords: ['games', 'entertaitment', 'tic_tac_toe', 'totito'],
    );
  }

  static RequestConfiguration get requestConfiguration => RequestConfiguration(
      maxAdContentRating: MaxAdContentRating.g,
      tagForUnderAgeOfConsent: TagForChildDirectedTreatment.yes,
      tagForChildDirectedTreatment: TagForChildDirectedTreatment.yes);
}
