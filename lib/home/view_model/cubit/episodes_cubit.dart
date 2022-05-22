import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prova1/home/model/episodes_model.dart';
import 'package:prova1/home/service/episodes_service.dart';

part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  EpisodesCubit() : super(EpisodesInitial());

  getEpisodes() async {
    try {
      emit(EpisodesLoading());
      final data = await EpisodesService().getEpisodes();
      if (data.isNotEmpty) {
        emit(EpisodesComplated(data));
      } else {
        emit(EpisodesError());
      }
    } catch (e) {
      emit(EpisodesError());
    }
  }
}
