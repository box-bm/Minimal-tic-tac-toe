import 'package:hydrated_bloc/hydrated_bloc.dart';

class SoundsCubit extends HydratedCubit<bool> {
  SoundsCubit() : super(true);

  toggleSounds() {
    emit(!state);
  }

  @override
  bool? fromJson(Map<String, dynamic> json) {
    return json['enabledSounds'] ?? true;
  }

  @override
  Map<String, dynamic>? toJson(bool state) {
    return {'enabledSounds': state};
  }
}
