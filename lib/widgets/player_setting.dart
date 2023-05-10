import 'package:minimal_tic_tac_toe/common.dart';
import 'package:minimal_tic_tac_toe/models/player.dart';
import 'package:minimal_tic_tac_toe/widgets/player_color_picker.dart';
import 'package:minimal_tic_tac_toe/widgets/player_icon_picker.dart';
import 'package:minimal_tic_tac_toe/widgets/player_input.dart';

class PlayerSetting extends StatelessWidget {
  final Player player;
  final int playerNumber;
  final bool hideColorPicker;
  final bool hideIconPicker;

  const PlayerSetting(
      {super.key,
      required this.playerNumber,
      required this.player,
      this.hideColorPicker = false,
      this.hideIconPicker = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlayerInput(player: player, playerNumber: playerNumber),
        Visibility(
            visible: !hideColorPicker,
            child:
                PlayerColorPicker(player: player, playerNumber: playerNumber)),
        Visibility(
            visible: !hideIconPicker,
            child:
                PlayerIconPicker(player: player, playerNumber: playerNumber)),
      ],
    );
  }
}
