import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/widgets/players_form.dart';

class Settings extends StatefulWidget {
  static String route = "/settings";
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  Color? selectedPlayerColor;

  void submitNewColor(int playerNumber) {
    context.read<PlayersBloc>().add(ChangePlayerColor(
        playerNumber: playerNumber, color: selectedPlayerColor!));
    closeChangeColorPicker();
  }

  void closeChangeColorPicker() {
    Navigator.pop(context);
  }

  void showColorPicker(Color playerColor, int playerNumber) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Select your color"),
              content: SingleChildScrollView(
                child: ColorPicker(
                    pickerColor: playerColor,
                    onColorChanged: (value) => setState(() {
                          selectedPlayerColor = value;
                        })),
              ),
              actions: [
                TextButton(
                    onPressed: closeChangeColorPicker,
                    child: const Text("Cancel")),
                ElevatedButton(
                    onPressed: () => submitNewColor(playerNumber),
                    child: const Text("Save"))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: SafeArea(
            minimum: const EdgeInsets.only(left: 10, right: 10, top: 12),
            child: Column(
              children: [
                const PlayersForm(
                  hideColorPicker: false,
                ),
                const Spacer(),
                TextButton.icon(
                    onPressed: () {
                      context.read<PlayersBloc>().add(ResetChanges());
                    },
                    icon: const Icon(Icons.restore_rounded),
                    label: const Text("Reset all changes"))
              ],
            )));
  }
}
