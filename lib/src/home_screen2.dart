import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:session_flutter/src/widgets/drawer.dart';
import 'package:session_flutter/src/models/movie_model.dart';
import 'package:http/http.dart' as http;

import 'trend_details.dart';

class MyWidget2 extends StatelessWidget {
  const MyWidget2({super.key});

  Future<List<Movie>?> fetchMovies() async {
    try {
      final Response response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiNDdjZTQ4MzE5YmIwZjAxNGU0ZjAzMzU1NWMyNjUyZSIsIm5iZiI6MTcyMDY2NjM3OC42NTA1MDMsInN1YiI6IjY2OGY0ODFhMmE2NmZjMDZmZWU2OWQzMSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YtP9EH6w2GdBdOuLccV7aeBNE8ympY978F9pURkuEoQ',
        },
      );
      final data = json.decode(response.body);
      final result = data['results'];
      return (result as List<dynamic>)
          .map((json) => Movie.fromJson(json))
          .toList();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Home Page'),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: fetchMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return const Center(child: Text('An error occurred'));
                } else {
                  if (snapshot.data == null) {
                    return const Center(child: Text('An error occurred'));
                  } else {
                    return _buildListView(snapshot.data!);
                  }
                }
              } else {
                return Center(
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.5,
                    color: Colors.red,
                    alignment: Alignment.center,
                    child: _buildLoading(),
                  ),
                );
              }
            }),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildListView(List<Movie> movies) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            movies[index].title ?? '',
            // movies[index].title == null ? '' : movies[index].title!,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Flexible(
            child: Text(
              movies[index].overview?.substring(0, 50) ?? '',
              overflow: TextOverflow.ellipsis,
            ),
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://image.tmdb.org/t/p/original${movies[index].posterPath}"),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TrendDetails(movies[index]),
              ),
            );
          },
        );
      },
    );
  }
}
