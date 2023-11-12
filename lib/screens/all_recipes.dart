

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:food_app/blocs/cuisine_bloc.dart';

import 'detail_cuisines.dart';

class AllRecipesScreen extends StatefulWidget {
  @override
  _AllRecipesScreenState createState() => _AllRecipesScreenState();
}

class _AllRecipesScreenState extends State<AllRecipesScreen> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFd9f6fc), Colors.white])),
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0),
            child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    prefixIcon: Icon(
                      Icons.search,
                      size: 30.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFd9f6fc), width: 1.0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFd9f6fc), width: 1.0),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1.0, color: Color(0xFFd9f6fc)),
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),
                bottom: PreferredSize(
                    child: TabBar(
                        isScrollable: true,
                        unselectedLabelColor: Colors.blue[900]!.withOpacity(0.3),
                        tabs: [
                          Tab(
                            child: Text('All'),
                          ),
                          Tab(
                            child: Text('Asian'),
                          ),
                          Tab(
                            child: Text('Mediteranian'),
                          ),
                          Tab(
                            child: Text('Arabian'),
                          ),
                          Tab(
                            child: Text('Thai'),
                          ),
                        ]),
                    preferredSize: Size.fromHeight(30.0)),
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.share, color: Colors.black),
                  ),
                ]),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CuisineCard(title: "Pudding", description: "Amount", imageUrl: "assets/pudding.png",),
                    CuisineCard(title: "Rice", description: "Amount", imageUrl: "assets/rice.png",),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CuisineCard(title: "Sushi", description: "Amount", imageUrl: "assets/sushi.png",),
                    CuisineCard(title: "Pizza", description: "Amount", imageUrl: "assets/pizza.png",),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CuisineCard(title: "Burgers", description: "Amount", imageUrl: "assets/burger.png",),
                    CuisineCard(title: "Tacos", description: "Amount", imageUrl: "assets/taco.png",),
                  ],
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}

class CuisineCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  CuisineCard({required this.title, required this.description, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(CuisineDetail(title: title, imageUrl: imageUrl,));
      },
      child: Container(
        margin: EdgeInsets.only(top: 25.0),
        height: 200.0,
        width: 150.0,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Text(title, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.lightBlue[600]),)
              ),
              SizedBox(height: 5.0),
              Container(child: Text(description)),
              Expanded(
                child: Image.asset(imageUrl,
                  width: 200.0,
                  height: 200.0,
                  fit: BoxFit.contain,),
              )
            ],
        ),
        ),
      ),
    );
  }
}
