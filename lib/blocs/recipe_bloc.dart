import 'dart:async';
import 'dart:convert';
import 'package:food_app/Models/Recipe.dart';
import 'package:http/http.dart';


enum RecipeAction { Fetch, delete }
class RecipeEvent {
  final String id;
  final RecipeAction status;

  RecipeEvent({required this.id,required this.status});
}

class RecipeBloc {
  Client client = Client();

  final _stateStreamController = StreamController<List<ExtendedIngredient>>();
  StreamSink<List<ExtendedIngredient> > get recipeSink => _stateStreamController.sink;
  Stream<List<ExtendedIngredient> > get recipeStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<RecipeEvent>();
  StreamSink<RecipeEvent> get recipeEventSink => _eventStreamController.sink;
  Stream<RecipeEvent> get recipeEventStream => _eventStreamController.stream;

  RecipeBloc() {
    recipeEventStream.listen((event) async {
      if(event.status == RecipeAction.Fetch){
        try {
            var recipe = await getRecipe();
          recipeSink.add(recipe.extendedIngredients);
        } on Exception catch (e) {
          recipeSink.addError("Something went wrong");
        }
      }
    });
  }

  Future<Recipe> getRecipe () async {
    var data;
    final basicInfo =
        'https://api.spoonacular.com/recipes/71246/information?includeNutrition=false&apiKey=fac992db122f4ac0a644c5bd1402e258';
    try {
      final Response response = await client.get(Uri.parse(basicInfo));
      if (response.statusCode == 200) {
        print(jsonDecode(response.body.toString()));
        return Recipe.fromJson(json.decode(response.body));
      }
    }
    catch(Exception) {
      return data;
    }
    return data;
  }
}