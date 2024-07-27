import 'package:flutter/material.dart';
import 'package:session_flutter/src/models/movie_model.dart';

class TrendDetails extends StatelessWidget {
  final Movie movie;
  const TrendDetails(this.movie, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title ?? ''),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              "https://image.tmdb.org/t/p/original${movie.posterPath}",
            ),
            const SizedBox(height: 16),
            Text(
              movie.title ?? "",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              child: Text(
                movie.overview ?? '',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('go back '),
            ),
          ],
        ),
      ),
    );
  }
}
