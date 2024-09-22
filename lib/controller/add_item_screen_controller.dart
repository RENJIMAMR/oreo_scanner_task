import 'package:flutter/material.dart';
import 'package:oreo_scanner_task/model/product_model.dart';
import 'package:oreo_scanner_task/view/dummydb.dart';

class AddItemScreenController with ChangeNotifier {
  List<ProductModel> scannedItems = [];

  void addScannedItemToBag(
      {required String id, required BuildContext context}) {
    // Check if the item with the given id is already in the scannedItems list
    bool itemExists = scannedItems.any((item) => item.itemId == id);

    // Only add the item if it is not already in the list
    if (!itemExists) {
      try {
        // Add the item to the bag from the DummyDb based on the itemId
        ProductModel product = DummyDb.products.firstWhere(
          (element) => element.itemId == id,
          orElse: () => throw Exception('Product not found'),
        );

        scannedItems.add(ProductModel(
          batchNumber: product.batchNumber,
          imagePath: product.imagePath,
          isRawMaterial: product.isRawMaterial,
          itemId: product.itemId,
          name: product.name,
          number: 1, // setting the initially required number of items to one
          quantity: product.quantity,
        ));
      } catch (e) {
        print(e);
      }

      notifyListeners();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Item Already in the bag"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Function to increment the number of an item needed
  void incrementQuantity(int index) {
    scannedItems[index].number = scannedItems[index].number + 1;
    notifyListeners();
  }

  // Function to decrement the number of an item needed
  void decrementQuantity(int index) {
    if (scannedItems[index].number > 1) {
      scannedItems[index].number = scannedItems[index].number - 1;
    } else {
      scannedItems.removeAt(
          index); // to remove  the item  if the item number is less than one
    }
    notifyListeners();
  }

  void clearItemsInBag() {
    scannedItems.clear();
    notifyListeners();
  }
}
