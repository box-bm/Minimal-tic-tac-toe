import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:minimal_tic_tac_toe/utils/ad_helper.dart';

class Ads {
  final MobileAds _ads = MobileAds.instance;

  void init() {
    _ads.updateRequestConfiguration(AdHelper.requestConfiguration);
    _ads.initialize();
  }
}
