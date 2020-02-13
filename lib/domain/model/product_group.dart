import 'package:petstop/domain/model/products.dart';

class ProductGroup {
  final List<Product> foodProducts;
  final List<Product> toyProducts;
  final List<Product> groomingProducts;

  ProductGroup({this.foodProducts, this.toyProducts, this.groomingProducts});
}