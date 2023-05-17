import 'package:minimal_tic_tac_toe/common.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Logo",
      image: true,
      child: Image.asset("assets/images/logo.png", fit: BoxFit.fitHeight),
    );
  }
}
