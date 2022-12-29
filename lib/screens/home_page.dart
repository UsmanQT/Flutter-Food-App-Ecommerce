import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/home_image.png"),
            fit: BoxFit.cover,
          ),
        ),
          ),
          Container(
            padding: EdgeInsets.only(left:20.0, top: 220.0),
            width: 170.0,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('All Recipes', style: TextStyle(fontSize:15.0, color: Colors.deepOrange)),
                      Icon(Icons.arrow_forward_rounded, color: Colors.deepOrange)
                    ],
                  ),
                )
            ),
          ),
        ]
      ),
    );
  }
}
