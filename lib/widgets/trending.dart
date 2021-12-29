import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/description.dart';
import 'package:movie_app/utils/text.dart';

class TrendingMovies extends StatelessWidget {
  final List? trending;
  const TrendingMovies({Key? key, this.trending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Trending Movies ❤‍🔥',
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Description(
                            name: trending![index]['title'],
                            bannerurl:
                                'https://image.tmdb.org/t/p/w500${trending![index]["backdrop_path"]}',
                            posterurl:
                                'https://image.tmdb.org/t/p/w500${trending![index]["poster_path"]}',
                            description: trending![index]["overview"],
                            vote: trending![index]["vote_average"].toString(),
                            launch_on:
                                trending![index]["release_date"].toString(),
                          );
                        },
                      ),
                    );
                  },
                  child: trending![index]['title'] != null
                      ? SizedBox(
                          width: 145,
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          trending![index]['poster_path'],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 3),
                                child: ModifiedText(
                                    text:
                                        trending![index]['title'] ?? 'Loading'),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
