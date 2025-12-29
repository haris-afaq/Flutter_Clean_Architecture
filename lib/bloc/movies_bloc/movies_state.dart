import 'package:clean_architecture_demu_project/data/api_response/api_response.dart';
import 'package:clean_architecture_demu_project/models/moview_model/movies.dart';
import 'package:equatable/equatable.dart';

class MoviesState extends Equatable{

  // List of movies
      ApiResponse<MoviesModel> moviesList;
   MoviesState({
    required this.moviesList
  });

    MoviesState copyWith({
      ApiResponse<MoviesModel>? moviesList
    }){
      return MoviesState(moviesList: moviesList?? this.moviesList);
    }

    @override
    List<Object> get props=>[moviesList];
}