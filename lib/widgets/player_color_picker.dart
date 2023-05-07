import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/models/player.dart';

class PlayerColorPicker extends StatefulWidget {
  final Player player;
  final int playerNumber;
  static String route = "/settings";

  const PlayerColorPicker(
      {super.key, required this.player, required this.playerNumber});

  @override
  State<PlayerColorPicker> createState() => _PlayerColorPickerState();
}

class _PlayerColorPickerState extends State<PlayerColorPicker> {
  Color? selectedPlayerColor;

  void submitNewColor() {
    context.read<PlayersBloc>().add(ChangePlayerColor(
        playerNumber: widget.playerNumber, color: selectedPlayerColor!));
    closeChangeColorPicker();
  }

  void closeChangeColorPicker() {
    Navigator.pop(context);
  }

  void showColorPicker(Color playerColor) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(S.of(context).selectYourColor),
              content: SingleChildScrollView(
                child: ColorPicker(
                    hexInputBar: false,
                    displayThumbColor: false,
                    pickerColor: playerColor,
                    onColorChanged: (value) => setState(() {
                          selectedPlayerColor = value;
                        })),
              ),
              actions: [
                TextButton(
                    onPressed: closeChangeColorPicker,
                    child: Text(S.of(context).cancel)),
                ElevatedButton(
                    onPressed: submitNewColor, child: Text(S.of(context).save))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 4),
        title: Text(S.of(context).colorOf(widget.player.playerName.isEmpty
            ? S.of(context).player(widget.playerNumber)
            : widget.player.playerName)),
        trailing: InkWell(
          borderRadius: BorderRadius.circular(100),
          onTap: () => showColorPicker(widget.player.color),
          child: CircleAvatar(backgroundColor: widget.player.color),
        ));
  }
}
