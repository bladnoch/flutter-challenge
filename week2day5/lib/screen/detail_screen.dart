import 'package:flutter/material.dart';
import 'package:week2day5/services/api_service.dart';

import '../models/movie_detail_model.dart';

class DetailScreen extends StatefulWidget {
  final String image, title, id;

  DetailScreen({
    super.key,
    required this.image,
    required this.title,
    required this.id,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  late Future<MovieDetailModel> movie;

  @override
  void initState() {
    super.initState();
    movie=ApiService.getDetail(widget.id);
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text("Back to list",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [

              ///Title
              Flexible(
                  flex: 7,
                  child:Container(
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      color: Colors.red,
                    ),
                    child: FutureBuilder(
                      future: movie,
                      builder: (context , snapshot){
                        if(snapshot.hasData){
                          return Text(snapshot.data!.title,
                            style: TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                            ),
                          );
                        }
                        return Text("please...");
                      },
                    ),
                  ),
              ),
              SizedBox(height: 5,),

              ///Stars
              Flexible(
                flex: 1,
                child:Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: FutureBuilder(
                    future: movie,
                    builder: (context , snapshot){
                      if(snapshot.hasData){
                        return Text("${snapshot.data!.vote_average} / 10",
                          style: TextStyle(
                            color: Colors.white70.withOpacity(0.6),
                          ),
                        );
                      }
                      return Text("please...");
                    },
                  ),

                ),
              ),
              SizedBox(height: 10,),


              ///hrs/genre
              Flexible(
                flex: 1,
                child:Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                  ),
                  child:  FutureBuilder(
                    future: movie,
                    builder: (context , snapshot){
                      if(snapshot.hasData){
                        return Text("${snapshot.data!.runtime}min  |  ${snapshot.data!.genres}",
                          style: TextStyle(
                            color: Colors.white70.withOpacity(0.6),
                          ),
                        );
                      }
                      return Text("please...");
                    },
                  ),

                ),
              ),

              ///Storyline
              Flexible(
                flex: 2,
                child:Container(
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                  child:  Text("Storyline",style: TextStyle(
                    color: Colors.white70,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                ),
              ),
              SizedBox(height: 5,),

              ///Storyline API
              Flexible(
                flex: 7,
                child:Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: FutureBuilder(
                    future: movie,
                    builder: (context , snapshot){
                      if(snapshot.hasData){
                        return Text(snapshot.data!.overview,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      }
                        return Text("please...");
                    },
                  )


                ),
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                height: 60,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber,
                    boxShadow:[
                      BoxShadow(
                          blurRadius:5,
                          offset: Offset(1,1),
                          color: Colors.black.withOpacity(0.2)
                      )
                    ]
                ),
                  child: Center(
                      child: Text(
                          "Buy ticket",style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                      ),),
                  ),
              ),
              SizedBox(height: 60,),
            ],
          ),
        ),
      ),
    );
  }
}
