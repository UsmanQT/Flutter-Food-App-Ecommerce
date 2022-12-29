import 'dart:async';
import 'dart:convert';

import 'package:food_app/Models/Cuisine.dart';
import 'package:http/http.dart';


enum CuisineAction { Fetch, delete }
class CuisineEvent {
  final String title;
  final CuisineAction status;

  CuisineEvent({this.title,this.status});
}

class CuisineBloc {
  final _stateStreamController = StreamController<List<Result>>();
  StreamSink<List<Result>> get cuisineSink => _stateStreamController.sink;
  Stream<List<Result>> get cuisineStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CuisineEvent>();
  StreamSink<CuisineEvent> get eventSink => _eventStreamController.sink;
  Stream<CuisineEvent> get eventStream => _eventStreamController.stream;

  CuisineBloc() {
    eventStream.listen((event) async {
      if(event.status == CuisineAction.Fetch) {
        try {
          var cuisines = await getCuisines(event.title);
          print(cuisines);
          cuisineSink.add(cuisines.searchResults[0].results);
        } on Exception catch (e) {
          cuisineSink.addError("Something went wrong");
        }
      }
    });
  }

  Future<Cuisine> getCuisines(String cuisine) async {
    var data;
    final basicInfo =
        'https://api.spoonacular.com/food/search?query=$cuisine&number=6&apiKey=fac992db122f4ac0a644c5bd1402e258';
    try {
      final Response response = await get(Uri.parse(basicInfo));
      if (response.statusCode == 200) {
        var jsonMap = jsonDecode(response.body);
        data = Cuisine.fromJson(jsonMap);
      }
    }
    catch(Exception) {
      return data;
    }
    return data;
  }
}