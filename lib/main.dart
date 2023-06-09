import 'dart:io';

import 'package:flutter/services.dart';
import 'package:minimal_tic_tac_toe/common.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:minimal_tic_tac_toe/utils/ads.dart';
import 'package:minimal_tic_tac_toe/utils/rate_app.dart';
import 'package:path_provider/path_provider.dart';
import 'package:minimal_tic_tac_toe/tic_tac_toe_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Directory dir = await getApplicationDocumentsDirectory();
  HydratedBloc.storage = await HydratedStorage.build(storageDirectory: dir);
  Ads.init();
  await rateMyApp.init();
  runApp(const TicTacToeApp());
}
