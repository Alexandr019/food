import 'package:dio/dio.dart';
import 'package:food/food_item.dart';

class FoodRepo {
  final Dio _dio;
  static const String _feedsEndpoint = '/feeds/list';

  FoodRepo(this._dio);

  Future<List<FoodItem>> fetchFoods() async {
    final json = await _dio.get(_feedsEndpoint);

    final data = json.data;

    return FoodItem.fromJsonList(data['feed']);
  }
}
