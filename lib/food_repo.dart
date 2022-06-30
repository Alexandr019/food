import 'package:dio/dio.dart';
import 'package:food/food_item.dart';

class FoodRepo {
  Future<List<FoodItem>> fetchFoods() async {
    final json = await Dio().get('https://yummly2.p.rapidapi.com/feeds/list',
        options: Options(headers: {
          'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
          'X-RapidAPI-Key': 'ac69a3c921msh8cf410c6cf97884p181dc6jsnd0285b2bcd4c'
        }));

    final data = json.data;

    return FoodItem.fromJsonList(data['feed']);
  }
}
