import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screening2/bloc/movie_bloc/movie_bloc.dart';
import 'package:screening2/constants/const.dart';
import 'package:screening2/model/movie_model.dart';
import 'package:screening2/presentaions/log_in.dart';
import 'package:screening2/presentaions/widgets/drawer.dart';
import 'package:screening2/repositorys/movie_repo.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieBloc(movieRepo: MovieRepo()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 114, 144, 169),
        ),
        // ignore: prefer_const_constructors
        drawer: DrawerWidget(),
        body: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieInitial) {
              context.read<MovieBloc>().add(FetchMovieEvent());
            }
            if (state is MovieFetchedState) {
              return _buildMovieList(state.movies, context);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget _buildMovieList(moviemodel movie, BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemCount: movie.result!.length,
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              height: 190,
              width: screenwidth,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Icon(Icons.arrow_drop_up, size: 45),
                            Text(movie.result![index].totalVoted.toString()),
                            const Icon(Icons.arrow_drop_down, size: 45),
                            Text(
                              'votes',
                              style: acmestyle,
                            )
                          ],
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: 70,
                          height: 120,
                          color: Colors.white,
                          child: Image.network(
                            movie.result![index].poster ?? posterurl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 15),
                        SizedBox(
                          width: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.result![index].title!,
                                style: GoogleFonts.acme(fontSize: 15),
                              ),
                              Text(
                                'genre : ${movie.result![index].genre}',
                                style: smallacme,
                              ),
                              Text(
                                'Director: ${movie.result![index].director![0]}',
                                style: smallacme,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'Starring: ${movie.result![index].stars![0]}',
                                style: smallacme,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${movie.result![index].runTime} | ${movie.result![index].language}|${movie.result![index].runTime}',
                                style: smallacme,
                              ),
                              FittedBox(
                                child: Text(
                                  '${movie.result![index].pageViews} views |voted by ${movie.result![index].totalVoted} people',
                                  style: GoogleFonts.acme(
                                      color: Colors.blue, fontSize: 10),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: screenwidth * 0.9,
                      height: 35,
                      color: Colors.blue,
                      child: Center(
                        child: TextButton(
                          child: Text(
                            'watch trailer',
                            style: acmestyle,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => Container(),
                            );
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
