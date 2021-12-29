import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TopRated extends StatelessWidget {
  final List? toprated;
  const TopRated({Key? key, this.toprated}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Top Rated Movies ✨✨',
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: toprated!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Description(
                            name: toprated![index]['title'],
                            bannerurl:
                                'https://image.tmdb.org/t/p/w500${toprated![index]["backdrop_path"]}',
                            posterurl:
                                'https://image.tmdb.org/t/p/w500${toprated![index]["poster_path"]}',
                            description: toprated![index]["overview"],
                            vote: toprated![index]["vote_average"].toString(),
                            launch_on:
                                toprated![index]["release_date"].toString(),
                          );
                        },
                      ),
                    );
                  },
                  child: toprated![index]['title'] != null
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
                                          toprated![index]['poster_path'],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 3),
                                child: ModifiedText(
                                    text:
                                        toprated![index]['title'] ?? 'Loading'),
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
