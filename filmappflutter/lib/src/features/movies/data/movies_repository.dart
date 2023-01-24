import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tmdb_movie_app_riverpod/env/env.dart';
import 'package:tmdb_movie_app_riverpod/src/features/movies/data/movies_pagination.dart';
import 'package:tmdb_movie_app_riverpod/src/features/movies/domain/tmdb_movie.dart';
import 'package:tmdb_movie_app_riverpod/src/features/movies/domain/tmdb_movies_response.dart';
import 'package:tmdb_movie_app_riverpod/src/utils/cancel_token_ref.dart';
import 'package:tmdb_movie_app_riverpod/src/utils/dio_provider.dart';

part 'movies_repository.g.dart';

class MoviesRepository {
  MoviesRepository({required this.client, required this.apiKey});
  final Dio client;
  final String apiKey;

  Future<List<TMDBMovie>> searchMovies(
      {required int page, String query = '', CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/search/movie',
      queryParameters: {
        'api_key': apiKey,
        'include_adult': 'false',
        'page': '$page',
        'query': query,
      },
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final movies = TMDBMoviesResponse.fromJson(response.data);
    return movies.results;
  }

  Future<List<TMDBMovie>> nowPlayingMovies(
      {required int page, CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/now_playing',
      queryParameters: {
        'api_key': apiKey,
        'include_adult': 'false',
        'page': '$page',
      },
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    final movies = TMDBMoviesResponse.fromJson(response.data);
    return movies.results;
  }

  Future<TMDBMovie> movie(
      {required int movieId, CancelToken? cancelToken}) async {
    final url = Uri(
      scheme: 'https',
      host: 'api.themoviedb.org',
      path: '3/movie/$movieId',
      queryParameters: {
        'api_key': apiKey,
        'include_adult': 'false',
      },
    ).toString();
    final response = await client.get(url, cancelToken: cancelToken);
    return TMDBMovie.fromJson(response.data);
  }
}

@riverpod
MoviesRepository moviesRepository(MoviesRepositoryRef ref) => MoviesRepository(
      client: ref.watch(dioProvider),
      apiKey: Env.tmdbApiKey,
    );

class AbortedException implements Exception {}

/// Provider to fetch a movie by ID
@riverpod
Future<TMDBMovie> movie(
  MovieRef ref, {
  required int movieId,
}) {
  final cancelToken = ref.cancelToken();
  return ref
      .watch(moviesRepositoryProvider)
      .movie(movieId: movieId, cancelToken: cancelToken);
}

/// Provider to fetch paginated movies data
@riverpod
Future<List<TMDBMovie>> fetchMovies(
  FetchMoviesRef ref, {
  required MoviesPagination pagination,
}) async {
  final moviesRepo = ref.watch(moviesRepositoryProvider);

  final cancelToken = CancelToken();
  final link = ref.keepAlive();
  Timer? timer;
  ref.onDispose(() {
    cancelToken.cancel();
    timer?.cancel();
  });
  ref.onCancel(() {
    timer = Timer(const Duration(seconds: 30), () {
      link.close();
    });
  });
  ref.onResume(() {
    timer?.cancel();
  });
  if (pagination.query.isEmpty) {
    return moviesRepo.nowPlayingMovies(
      page: pagination.page,
      cancelToken: cancelToken,
    );
  } else {
    await Future.delayed(const Duration(milliseconds: 500));
    if (cancelToken.isCancelled) throw AbortedException();
    // use search endpoint
    return moviesRepo.searchMovies(
      page: pagination.page,
      query: pagination.query,
      cancelToken: cancelToken,
    );
  }
}
