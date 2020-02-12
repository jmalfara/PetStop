import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petstop/domain/model/product_group.dart';
import 'package:petstop/domain/model/products.dart';

import '../client.dart';

abstract class ProductsService {
  Client client;

  ProductsService(Client client) :
        client = client;

  Future<ProductGroup> fetchFoodProducts();
}

class ProductsServiceImpl extends ProductsService {
  ProductsServiceImpl(Client client) : super(client);

  @override
  Future<ProductGroup> fetchFoodProducts() async {
    //Rabbit
    QuerySnapshot snapshot = await Firestore.instance.collection("services/food/rabbit").getDocuments();
    List<Product> rabbitProducts = parseProducts(snapshot);

    return ProductGroup(
      dogProducts: List(),
      catProducts: List(),
      rabbitProducts: rabbitProducts
    );
  }

  List<Product> parseProducts(QuerySnapshot snapshot) {
    List<Product> product = List();

    snapshot.documents.forEach((doc) {
      Map<String, dynamic> data = doc.data;
      product.add(Product(
        name: data["name"],
        description: data["description"],
        imageUrl: data["imageUrl"]
      ));
    });

    return product;
  }
}
