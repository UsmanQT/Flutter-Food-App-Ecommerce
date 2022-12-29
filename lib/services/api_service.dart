import 'dart:convert';
import 'package:food_app/Models/Cuisine.dart';
import 'package:http/http.dart';

//TODO: Split the networking services.

//Service to get the recipies for three meals.
class ApiService {

  Future<Cuisine> getCuisines() async {
    var data;
    final basicInfo =
        'https://api.spoonacular.com/recipes/search?cuisine&apiKey=fac992db122f4ac0a644c5bd1402e258';
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
    print(data);
    return data;
  }
}