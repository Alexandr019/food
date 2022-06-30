import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/food_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  late FoodCubit _foodCubit;

  @override
  void initState() {
    super.initState();
    setState(() {
      _foodCubit = FoodCubit()..fetchFoods();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: BlocBuilder(
          bloc: _foodCubit,
          builder: (context, FoodState state) {
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
              body: state.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: state.foods.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.all(5.0),
                          color: Colors.white,
                          child: Text(''
                          ),
                        );
                      }),
            );
          }),
    );
  }
}
