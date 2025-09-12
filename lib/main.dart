import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubit/app_cubit.dart';
import 'package:store_app/home%20layout/home_layout.dart';
import 'package:store_app/screens/home_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeLayout(),
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.white),
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
