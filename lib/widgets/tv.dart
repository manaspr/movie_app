import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/text.dart';

import '../description.dart';

class TV extends StatelessWidget {
  final List? tv;
  const TV({Key? key, this.tv}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ModifiedText(
            text: 'Top TV Shows 📺',
            size: 26,
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tv!.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Description(
                            name: tv![index]['original_name'],
                            bannerurl:
                                'https://image.tmdb.org/t/p/w500${tv![index]["backdrop_path"]}',
                            posterurl:
                                'https://image.tmdb.org/t/p/w500${tv![index]["poster_path"]}',
                            description: tv![index]["overview"],
                            vote: tv![index]["vote_average"].toString(),
                            launch_on: tv![index]["first_air_date"].toString(),
                          );
                        },
                      ),
                    );
                  },
                  child: tv![index]['original_name'] != null
                      ? Container(
                          padding: EdgeInsets.all(5),
                          width: 250,
                          child: Column(
                            children: [
                              Container(
                                width: 250,
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://image.tmdb.org/t/p/w500' +
                                          tv![index]['backdrop_path'],
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              ModifiedText(
                                  text:
                                      tv![index]['original_name'] ?? 'Loading'),
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
