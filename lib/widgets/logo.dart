import 'package:tik_tak_toe/common.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Logo",
      child: Image.asset("images/logo.png", fit: BoxFit.fitHeight),
    );
  }
}
