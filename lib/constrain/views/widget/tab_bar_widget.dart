import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie/constrain/models/movie.dart';
import 'package:movie/constrain/service/movie_servies.dart';

class TabBarWidget extends StatelessWidget {
  final FutureProvider getMovie;

  final String PageKey;
  const TabBarWidget(
      {super.key, required this.getMovie, required this.PageKey});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final data = ref.watch(getMovie);
      return data.when(
          data: (data) {
            return GridView.builder(
                key: PageStorageKey(PageKey),
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.network(data[index].poster_path),
                    ],
                  );
                });
          },
          error: (err, stack) =>
              const Center(child: Text("Something went wrong")),
          loading: () => const Center(child: CircularProgressIndicator()));
    });
  }
}
