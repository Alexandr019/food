import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/food_repo.dart';
import 'package:food/food_item.dart';

class FoodCubit extends Cubit<FoodState> {
  final FoodRepo _foodRepo;

  FoodCubit(this._foodRepo) : super(FoodState());

  void fetchFoods() async {
    emit(FoodState(isLoading: true));
    List<FoodItem> foods = await _foodRepo.fetchFoods();
    emit(FoodState(foods: foods));
  }
}

class FoodState {
  final List<FoodItem> foods;
  final bool isLoading;

  FoodState({this.isLoading = false, this.foods = const []});
}
