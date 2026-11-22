import 'package:minimal_tic_tac_toe/common.dart';
import 'package:share_plus/share_plus.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: S.of(context).share,
      child: IconButton(
          onPressed: () async {
            await SharePlus.instance
                .share(ShareParams(text: S.of(context).shareTextContent));
          },
          icon: const Icon(Icons.share_outlined)),
    );
  }
}
