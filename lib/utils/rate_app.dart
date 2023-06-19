import 'package:minimal_tic_tac_toe/common.dart';
import 'package:rate_my_app/rate_my_app.dart';

RateMyApp rateMyApp = RateMyApp(
  preferencesPrefix: 'minimalTicTacToeRateApp',
  minDays: 7,
  minLaunches: 10,
  remindDays: 7,
  remindLaunches: 10,
  googlePlayIdentifier: 'com.boxdev.minimal_tic_tac_toe',
  // TODO: implement: appStoreIdentifier: '1491556149' // for ios,
);

void showStarRateDialog(BuildContext context) {
  rateMyApp.showStarRateDialog(
    context,
    title: S.of(context).rateTitle,
    message: S.of(context).rateMessage,
    actionsBuilder: (context, stars) {
      return [
        ElevatedButton(
          child: Text(S.of(context).rateButton),
          onPressed: () {
            rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
            Navigator.pop<RateMyAppDialogButton>(
                context, RateMyAppDialogButton.rate);
          },
        ),
      ];
    },
    ignoreNativeDialog: true,
    dialogStyle: const DialogStyle(
      titleAlign: TextAlign.center,
      messageAlign: TextAlign.center,
      messagePadding: EdgeInsets.only(bottom: 20),
    ),
    starRatingOptions:
        const StarRatingOptions(), // Custom star bar rating options.
    onDismissed: () => rateMyApp.callEvent(RateMyAppEventType
        .laterButtonPressed), // Called when the user dismissed the dialog (either by taping outside or by pressing the "back" button).
  );
}
