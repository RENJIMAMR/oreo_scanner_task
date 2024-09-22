import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:oreo_scanner_task/model/bag_model.dart';

class HomeScreenController with ChangeNotifier {
  List<BagModel> bagList = [];

  // Method to add a BagModel item to the Hive box
  Future<void> addBagItem(BagModel bag) async {
    final bagBox = await Hive.openBox<BagModel>("bags");
    await bagBox.add(bag); // Adds the BagModel object to the Hive box
    await bagBox.close();
  }

  // Method to retrieve all items from the Hive box
  Future<void> getBagItems() async {
    final bagBox = await Hive.openBox<BagModel>("bags");
    bagList = bagBox.values
        .toList(); // Retrieves all BagModel objects from the Hive box as a List
    await bagBox.close();
    notifyListeners();
  }
}
