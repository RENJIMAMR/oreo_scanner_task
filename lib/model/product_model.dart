import 'package:hive/hive.dart';
part 'product_model.g.dart';

@HiveType(typeId: 1)
class ProductModel {
  @HiveField(0)
  String? itemId; // Unique ID for the item
  @HiveField(1)
  String? name; // Name of the product
  @HiveField(2)
  String? quantity; // Quantity of the product like kg, packet
  @HiveField(3)
  int number; // Number of the product
  @HiveField(4)
  bool? isRawMaterial; // Flag to know if it is a raw material or product
  @HiveField(5)
  String? batchNumber; // Batch number for the product
  @HiveField(6)
  String? imagePath; // Image path for the product

  ProductModel({
    this.imagePath,
    this.itemId,
    this.name,
    this.quantity,
    this.number = 0,
    this.isRawMaterial,
    this.batchNumber,
  });
}
