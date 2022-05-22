import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../view_model/bloc/character_bloc.dart';
import '../view_model/cubit/episodes_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Rick&Morty',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w300),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () {},
            ),
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Characters',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                Text(
                  'See all',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 150,
              child: BlocConsumer<CharacterBloc, CharacterState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is CharacterLoading) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else if (state is CharacterComplated) {
                    return ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: GestureDetector(
                          onTap: () => null,
                          child: SizedBox(
                            width: 200,
                            child: Image.network(
                              'https://picsum.photos/800/800',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      separatorBuilder: (BuildContext context, int index) =>
                          const SizedBox(width: 10),
                    );
                  } else if (state is CharacterError) {
                    return const Center(child: Text('Hataa'));
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              'Episodes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: BlocConsumer<EpisodesCubit, EpisodesState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is EpisodesComplated) {
                    return ListView.separated(
                      itemCount: state.episodes.length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          title: Text(state.episodes[index].episode.toString()),
                          subtitle:
                              Text(state.episodes[index].airDate.toString()),
                          trailing: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_right),
                          ),
                        ),
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 5),
                    );
                  } else if (state is EpisodesLoading) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  } else {
                    return const Center(child: Text('Hata'));
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
