import 'package:minimal_tic_tac_toe/common.dart';
import 'package:rate_my_app/rate_my_app.dart';

RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 7,
    minLaunches: 10,
    remindDays: 7,
    remindLaunches: 10,
    googlePlayIdentifier: 'com.boxdev.minimal_tic_tac_toe',
    appStoreIdentifier: 'com.boxdev.minimaltictactoe');

void showStarRateDialog(BuildContext context) {
  rateMyApp.showStarRateDialog(
    context,
    title: S.of(context).rateTitle, // The dialog title.
    message: S.of(context).rateMessage, // The dialog message.
    // contentBuilder: (context, defaultContent) => content, // This one allows you to change the default dialog content.
    actionsBuilder: (context, stars) {
      // Triggered when the user updates the star rating.
      return [
        // Return a list of actions (that will be shown at the bottom of the dialog).
        ElevatedButton(
          child: Text(S.of(context).rateButton),
          onPressed: () async {
            if (context.mounted) {
              await rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
              Navigator.pop<RateMyAppDialogButton>(
                  // ignore: use_build_context_synchronously
                  context,
                  RateMyAppDialogButton.rate);
            }
          },
        ),
      ];
    },
    ignoreNativeDialog: false,
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
