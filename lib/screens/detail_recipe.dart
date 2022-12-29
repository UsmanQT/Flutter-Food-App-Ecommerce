import 'package:flutter/material.dart';
import 'package:food_app/blocs/recipe_bloc.dart';

class RecipeDetail extends StatefulWidget {
  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  final recipeBloc = new RecipeBloc();

  @override
  void initState() {
    // TODO: implement initState
    recipeBloc.recipeEventSink.add(RecipeEvent(id: "648506", status: RecipeAction.Fetch));
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: recipeBloc.recipeStream,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Expanded(
                child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      var result = snapshot.data[index];
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
                                      child: Image.network(result.image, height: 100.0, width: 100.0,),
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
            return Text('no data sup?');
        }
        )
      )
    );
  }
}
