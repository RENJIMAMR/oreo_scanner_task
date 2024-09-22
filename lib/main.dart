import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:oreo_scanner_task/controller/add_item_screen_controller.dart';
import 'package:oreo_scanner_task/controller/home_screen_controller.dart';
import 'package:oreo_scanner_task/model/bag_model.dart';
import 'package:oreo_scanner_task/model/product_model.dart';
import 'package:oreo_scanner_task/view/bottom_nav_bar_screen/botttom_nav_bar_screen.dart';
import 'package:oreo_scanner_task/view/splash_screen/splash_screen.dart';
import 'package:provider/provider.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initializes Hive for Flutter, allowing it to store and manage data
  await Hive.initFlutter();

  // Registers the ProductModel adapter with Hive, so it knows how to handle objects of this type
  Hive.registerAdapter(ProductModelAdapter());

  // Registers the BagModel adapter with Hive for managing BagModel objects
  Hive.registerAdapter(BagModelAdapter());

  // Opens a Hive box with the name "bags"
  var box = await Hive.openBox<BagModel>("bags");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(create: (context) => AddItemScreenController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: SplashScreen(),
      ),
    );
  }
}
