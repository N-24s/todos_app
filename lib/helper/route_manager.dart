import 'package:flutter/material.dart';
import 'package:todos_app/core/views/screen/home_screen.dart';

class RouteManager {
  static Route<dynamic>? appRoutes(RouteSettings route){

    switch(route.name){
      case '/home':return MaterialPageRoute(builder: (ctx)=>const HomeScreen());
    }

  }
}