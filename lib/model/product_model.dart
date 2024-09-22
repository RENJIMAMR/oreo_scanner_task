class ProductModel {
  final String itemId; // Unique ID for the item
  final String name; // Name of the product
  final String quantity; // Quantity of the product like kg, packet
  final int number; // Number  of the product
  final bool isRawMaterial; // Flag to know if it is a raw material or product
  final String batchNumber; // Batch number for the product
  final String imagePath;

  ProductModel({
    required this.imagePath,
    required this.itemId,
    required this.name,
    required this.quantity,
    this.number = 0,
    required this.isRawMaterial,
    required this.batchNumber,
  });
}
