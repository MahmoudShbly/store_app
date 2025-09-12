import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/cubit/app_cubit.dart';
import 'package:store_app/screens/favouriet_products_page.dart';
import 'package:store_app/screens/home_page.dart';
//ignore: must_be_immutable
class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          

          appBar: AppBar(
            actions: [IconButton(icon: Icon(FontAwesomeIcons.cartShopping),onPressed: (){},)],
            centerTitle: true,
            title: Text('NEW TREND'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blueAccent,
            unselectedItemColor: Colors.grey,
            currentIndex: cubit.currentIndex,
            items: [
              
              BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.heart),
                label: 'Favouriet',
              ),
            ],
            
            onTap: (index)=>cubit.changeBottomNavigationBarIndex(index),
          ),
          body: cubit.screens[cubit.currentIndex],
    
        );
      },
    );
  }
}
