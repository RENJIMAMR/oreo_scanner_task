class ProductModel {
  String? itemId; // Unique ID for the item
  String? name; // Name of the product
  String? quantity; // Quantity of the product like kg, packet
  int number; // Number of the product
  bool? isRawMaterial; // Flag to know if it is a raw material or product
  String? batchNumber; // Batch number for the product
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
