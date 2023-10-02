import 'package:flutter/material.dart';
import 'package:movie/constrain/service/movie_servies.dart';
import 'package:movie/constrain/views/widget/tab_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //provide controller
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100, //height of the appbar
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Watch Now",
                      style: TextStyle(fontSize: 20),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search))
                  ]),
            ),
          ),

          //provide navigation on tab bar
          bottom: const TabBar(tabs: [
            Tab(text: 'popular'),
            Tab(text: 'Top Rated'),
            Tab(text: 'Upcoming')
          ]),
        ),

        //body

        body: TabBarView(physics: NeverScrollableScrollPhysics(), children: [
          TabBarWidget(
            getMovie: moviePopular,
            PageKey: "P",
          ),
          TabBarWidget(
            getMovie: movieTopRated,
            PageKey: "T",
          ),
          TabBarWidget(
            getMovie: movieUpComing,
            PageKey: "u",
          ), // calling the api from provider
        ]),
      ),
    );
  }
}
