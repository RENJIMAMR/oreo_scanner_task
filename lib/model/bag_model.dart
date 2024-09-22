import 'package:hive/hive.dart';
import 'package:oreo_scanner_task/model/product_model.dart';

part 'bag_model.g.dart';

@HiveType(typeId: 2)
class BagModel {
  @HiveField(0)
  String? time; // Stores the time associated with the bag

  @HiveField(1)
  String? date; // Stores the date associated with the bag

  @HiveField(2)
  List<ProductModel>? bagItems; // List of items (ProductModel) in the bag

  BagModel({this.time, this.date, this.bagItems});
}
