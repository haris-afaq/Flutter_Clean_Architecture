import 'package:bloc/bloc.dart';
import 'package:clean_architecture_demu_project/bloc/movies_bloc/movies_events.dart';
import 'package:clean_architecture_demu_project/bloc/movies_bloc/movies_state.dart';
import 'package:clean_architecture_demu_project/data/api_response/api_response.dart';
import 'package:clean_architecture_demu_project/models/moview_model/movies.dart';
import 'package:clean_architecture_demu_project/repositories/auth_repository/movies_repository.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesState> {
  
  final MoviesRepository moviesRepository = MoviesRepository();

  MoviesBloc() : super(MoviesState(moviesList: ApiResponse.loading())) {
    on<MoviesFetched>(_onMoviesFetched);
  }

  Future<void> _onMoviesFetched(MoviesFetched event,Emitter<MoviesState> emit,) async {
    await moviesRepository.moviesApi().then((value){
      emit(state.copyWith(
        moviesList: ApiResponse.completed(value)));

    }).onError((error, stackTrace){
      emit(state.copyWith(
        moviesList: ApiResponse.error(error.toString() as MoviesModel?)
      ));
    });
  }
}
