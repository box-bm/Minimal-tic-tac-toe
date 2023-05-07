import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';

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
        body: SafeArea(child: BlocBuilder<PlayersBloc, PlayersState>(
          builder: (context, state) {
            return Column(
              children: [
                ListTile(
                    title: const Text("Color Player 1"),
                    trailing: InkWell(
                      onTap: () => showColorPicker(state.player1.color, 1),
                      child: CircleAvatar(backgroundColor: state.player1.color),
                    )),
                ListTile(
                    title: const Text("Color Player 2"),
                    trailing: InkWell(
                      onTap: () => showColorPicker(state.player2.color, 2),
                      child: CircleAvatar(backgroundColor: state.player2.color),
                    )),
              ],
            );
          },
        )));
  }
}
