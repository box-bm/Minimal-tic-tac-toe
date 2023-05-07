import 'package:tik_tak_toe/common.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tik_tak_toe/bloc/players/players_bloc.dart';
import 'package:tik_tak_toe/repository/available_icons.dart';

class IconSelection extends StatelessWidget {
  static String route = "/iconSelection";
  const IconSelection({super.key});

  @override
  Widget build(BuildContext context) {
    int? playerNumber = ModalRoute.of(context)?.settings.arguments as int?;

    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar.large(
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(5),
              child: Text("Choise your favorite icon"),
            ),
            title: const Text("Icons"),
            centerTitle: false,
            floating: true,
            snap: true),
        SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 5.0,
              childAspectRatio: 2.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Center(
                    child: IconButton(
                        onPressed: () {
                          if (playerNumber == null) {
                            return;
                          }
                          context.read<PlayersBloc>().add(ChangePlayerIconData(
                              playerNumber: playerNumber,
                              iconData: icons.elementAt(index)));
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          icons.elementAt(index),
                          size: 40,
                        )));
              },
              childCount: icons.length,
            ))
      ]),
    );
  }
}
