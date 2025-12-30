import 'package:clean_architecture_demu_project/bloc/movies_bloc/movies_bloc.dart';
import 'package:clean_architecture_demu_project/bloc/movies_bloc/movies_events.dart';
import 'package:clean_architecture_demu_project/bloc/movies_bloc/movies_state.dart';
import 'package:clean_architecture_demu_project/config/components/custom_alert_dialoge_box.dart';
import 'package:clean_architecture_demu_project/config/components/loading.dart';
import 'package:clean_architecture_demu_project/config/components/no_internet_error.dart';
import 'package:clean_architecture_demu_project/config/components/text_style/heading2.dart';
import 'package:clean_architecture_demu_project/config/constants/colors.dart';
import 'package:clean_architecture_demu_project/config/constants/strings.dart';
import 'package:clean_architecture_demu_project/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Heading2(title: "HomeScreen"),
        automaticallyImplyActions: false,
        actions: [
          IconButton(
            onPressed: (){
              CustomAlertDiaglogeBox.show(
                context,
                title: AppStrings.logout,
                message: AppStrings.logoutMessage,
                primaryButtonText: AppStrings.alertDialogePrimaryText,
                onPrimaryPressed: (){
                  // Navigator.pop(context);
                },
                secondaryButtonText: AppStrings.alertDialogeSecondaryText,
                onSecondaryPressed: (){
                      // Navigator.pop(context);
                }
              );
            },
             icon: Icon(Icons.logout_outlined, color: AppColors.redColor,))
        ],
      ),
      body: BlocProvider(create: (_) =>MoviesBloc()..add(MoviesFetched()),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (BuildContext context, state){
          switch (state.moviesList.status){

            // Loading...
            case Status.loading:
            return Center(
              child: LoadingWidget(),
            );

            // Error...
            case Status.error:
  return Center(
    child: Text(state.moviesList.message ?? "Something went wrong"),
  );

            // case Status.error:
            // return Center(
            //   child: NotInternetError(onPress: (){
            //        context.read<MoviesBloc>().add(MoviesFetched());
            //   }),
            // );

            // Success...
            case Status.completed: {
              if(state.moviesList.data == null){
                return Text("No data found...!");
              }
              final moviesList = state.moviesList.data!;
              return ListView.builder(
                itemCount: moviesList.tvShow.length,
                itemBuilder: (context, index){
                  final tvShows = moviesList.tvShow[index];
                  return Card(
                    child: ListTile(
                      title: Text(tvShows.name.toString()),
                      subtitle: Text(tvShows.network.toString()),
                      trailing: Text(tvShows.status.toString()),
                    ),
                  );
                });
            }
            default:
             return SizedBox();
          }
       
      }),
      )
    );
  }
}