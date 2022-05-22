part of 'episodes_cubit.dart';

abstract class EpisodesState extends Equatable {
  const EpisodesState();

  @override
  List<Object> get props => [];
}

class EpisodesInitial extends EpisodesState {}

class EpisodesLoading extends EpisodesState {}

class EpisodesComplated extends EpisodesState {
  final List<EpisodesModel> episodes;

  EpisodesComplated(this.episodes);
}

class EpisodesError extends EpisodesState{}