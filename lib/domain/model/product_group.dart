import 'package:petstop/domain/model/pet.dart';
import 'package:petstop/domain/model/products.dart';

class ProductGroup {
  final List<Product> dogProducts;
  final List<Product> catProducts;
  final List<Product> rabbitProducts;

  ProductGroup({this.dogProducts, this.catProducts, this.rabbitProducts});
}