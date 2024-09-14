import 'package:flutter/material.dart';
import 'package:todos_app/helper/route_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/home',
      onGenerateRoute: RouteManager.appRoutes,
      
    );
  }
}