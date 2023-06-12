import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:games_services/games_services.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void signIn() => GameAuth.signIn();
  void signOut() => GameAuth.signOut();

  void showLeaderboards() {
    Leaderboards.showLeaderboards(
        iOSLeaderboardID: 'ios_leaderboard_id',
        androidLeaderboardID: 'android_leaderboard_id');
  }

  void showAchievements() {
    Achievements.showAchievements();
  }
}
