import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:minimal_tic_tac_toe/utils/ad_helper.dart';
import 'package:minimal_tic_tac_toe/common.dart';

class AddBanner extends StatefulWidget {
  const AddBanner({super.key});

  @override
  State<AddBanner> createState() => _AddBannerState();
}

class _AddBannerState extends State<AddBanner> {
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdHelper.addRequest,
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          if (kDebugMode) {
            print('Failed to load a banner ad: ${err.message}');
          }
          ad.dispose();
        },
      ),
    ).load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _bannerAd?.size.width.toDouble(),
      height: _bannerAd?.size.height.toDouble(),
      child: _bannerAd != null ? AdWidget(ad: _bannerAd!) : null,
    );
  }
}
