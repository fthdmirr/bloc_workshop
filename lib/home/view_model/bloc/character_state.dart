part of 'character_bloc.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object> get props => [];
}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterComplated extends CharacterState {
  final List<CharacterModel> characters;

  const CharacterComplated(this.characters);
}

class CharacterError extends CharacterState{}
