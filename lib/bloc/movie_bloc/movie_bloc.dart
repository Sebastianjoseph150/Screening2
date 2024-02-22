import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:http/retry.dart';
import 'package:meta/meta.dart';
import 'package:screening2/model/movie_model.dart';
import 'package:screening2/repositorys/movie_repo.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepo movieRepo;

  MovieBloc({required this.movieRepo}) : super(MovieInitial()) {
    on<FetchMovieEvent>(_fetchMovie);
  }

  Future<void> _fetchMovie(
    FetchMovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoadingState()); 
    try {
      final moviemodel response = await movieRepo.getMovies();
      emit(MovieFetchedState(movies: response)); 
    } catch (e) {
      emit(MovieErrorState('Failed to fetch movies')); 
    }
  }
}

