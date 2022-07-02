import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/constants.dart';
import 'package:food/food_cubit.dart';
import 'package:food/food_repo.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() {
    return _FoodPageState();
  }
}

class _FoodPageState extends State<FoodPage> {
  late FoodCubit _foodCubit;

  @override
  void initState() {
    super.initState();
    setState(
      () {
        _foodCubit = FoodCubit(
          FoodRepo(
            Dio(
              BaseOptions(
                baseUrl: baseUrl,
                headers: headers,
              ),
            ),
          ),
        )..fetchFoods();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.restaurant_menu, color: Colors.black),
            SizedBox(width: 10),
            Text(
              'Food Recipe',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                letterSpacing: 1,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder(
        bloc: _foodCubit,
        builder: (context, FoodState state) {
          return state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: state.foods.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 22, vertical: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.6),
                            offset: const Offset(
                              0.0,
                              10.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: -6.0,
                          ),
                        ],
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.2),
                            BlendMode.multiply,
                          ),
                          image: NetworkImage(state.foods[index].images),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Text(
                                state.foods[index].name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Align(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        state.foods[index].rating.toString(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.schedule,
                                        color: Colors.yellow,
                                        size: 18,
                                      ),
                                      const SizedBox(width: 7),
                                      Text(
                                        state.foods[index].totalTime,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            alignment: Alignment.bottomLeft,
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
