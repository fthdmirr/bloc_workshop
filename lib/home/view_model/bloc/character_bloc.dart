import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prova1/home/model/character_model.dart';
import 'package:prova1/home/service/character_view.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterInitial()) {
    on<GetCharacters>((event, emit) async {
      emit(CharacterLoading());

      try {
        final List<CharacterModel> result =
            await CharacterService().getCharacter();
        if (result.isNotEmpty) {
          emit(CharacterComplated(result));
        } else {
          emit(CharacterError());
        }
      } catch (e) {
        emit(CharacterError());
      }
    });
  }
}
