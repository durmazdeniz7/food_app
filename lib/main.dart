import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubit/cart_cubit.dart';
import 'package:food_app/cubit/dashboard_cubit.dart';
import 'package:food_app/cubit/detail_page_cubit.dart';
import 'package:food_app/views/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>DashBoardCubit()),
        BlocProvider(create: (context)=>DetailPageCubit()),
        BlocProvider(create: (context)=>CartCubit()),


      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DashBoard(),
      ),
    );
  }
}
