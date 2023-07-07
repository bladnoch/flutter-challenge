import 'package:flutter/material.dart';
import 'package:week2day5/screen/detail_screen.dart';

class ComingMovie extends StatelessWidget {
  final String image, title, id;

  ComingMovie({
    super.key,
    required this.image,
    required this.title,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => DetailScreen(image: image, title: title, id: id) ),);
      },
      child: Column(
        children: [
          Container(
            height: 100,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow:[
                  BoxShadow(
                      blurRadius:5,
                      offset: Offset(2,2),
                      color: Colors.black.withOpacity(0.8)
                  )
                ]
            ),
            child: Image.network(image),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 170,
            child: Center(
              child: Text(title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),),
            ),
          ),
        ],
      ),
    );
  }
}
