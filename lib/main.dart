import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/cubit/cart_cubit.dart';
import 'package:food_app/cubit/dashboard_cubit.dart';
import 'package:food_app/cubit/detail_page_cubit.dart';
import 'package:food_app/repo/auth_service.dart';
import 'package:food_app/views/dashboard.dart';
import 'package:food_app/views/login_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DashBoardCubit()),
        BlocProvider(create: (context) => DetailPageCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
            create: (_) => AuthService2(), child: const LoginPage()),
      ),
    );
  }
}
