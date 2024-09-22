import 'package:flutter/material.dart';
import 'package:oreo_scanner_task/controller/add_item_screen_controller.dart';
import 'package:oreo_scanner_task/view/bottom_nav_bar_screen/botttom_nav_bar_screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddItemScreenController(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: BottomNavBarScreen(),
      ),
    );
  }
}
