import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prova1/home/view_model/cubit/episodes_cubit.dart';

import 'home/view/home_view.dart';
import 'home/view_model/bloc/character_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CharacterBloc>(
      create: (context) => CharacterBloc()..add(GetCharacters())),
       BlocProvider<EpisodesCubit>(
      create: (context) => EpisodesCubit()..getEpisodes()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeView(),
    );
  }
}
