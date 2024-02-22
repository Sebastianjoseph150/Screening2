part of 'movie_bloc.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

class MovieFetchedState extends MovieState {
  final moviemodel movies;
  MovieFetchedState({required this.movies});
}

class MovieLoadingState extends MovieState {}

class MovieErrorState extends MovieState {
  final String message;

  MovieErrorState(this.message);
}
