import 'package:flutter/material.dart';
import 'package:food_app/Models/Cuisine.dart';
import 'package:food_app/blocs/cuisine_bloc.dart';
import 'package:get/get.dart';

class CuisineDetail extends StatefulWidget {
  final String title;
  final String imageUrl;

  CuisineDetail({required this.title, required this.imageUrl});

  @override
  _CuisineDetailState createState() => _CuisineDetailState();
}

class _CuisineDetailState extends State<CuisineDetail> {
   CuisineBloc cuisineBloc = new CuisineBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cuisineBloc.eventSink.add(CuisineEvent(title: widget.title, status: CuisineAction.Fetch));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back,), onTap: () {
          Get.back();
        },),
        actions: [
          Icon(Icons.favorite_border)
        ],
        elevation: 0.0,
      ),
      body: Container(
        color: Color(0xFFd9f6fc),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
                Padding(
                  padding: const EdgeInsets.only(left:16.0, right: 16.0, bottom: 16.0),
                  child: Card(
                    color: Colors.lightBlueAccent,
                    child: Image.asset(widget.imageUrl,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,),),
                ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text('Tamaki Tamiya', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.blueGrey),
                      ),
                  ]
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(widget.title, style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold, color: Colors.blueGrey),),
              ),
              StreamBuilder<List<Result>>(
                stream: cuisineBloc.cuisineStream,
                  builder: (context, snapshot) {
                  if(snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                          var result = snapshot.data?[index];
                        return GestureDetector(
                          onTap: () {
                            //cuisineBloc.eventSink.add(CuisineAction.Fetch);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: ClipRRect (
                                        borderRadius: BorderRadius.circular(30.0),
                                          child: Image.network(result!.image, height: 100.0, width: 100.0,),
                                      ),
                                    ),
                                    Expanded(child: Text(result.name))
                                  ],
                                )),
                          ),
                        );
                      }),
                    );
                  }
                  else {
                    return Center(child: CircularProgressIndicator());
                  }
              }),
            ],
          ),
      )
    );
  }
}
