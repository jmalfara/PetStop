import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petstop/domain/model/product_group.dart';
import 'package:petstop/domain/model/products.dart';

import '../client.dart';

abstract class ProductsService {
  Client client;

  ProductsService(Client client) :
        client = client;

  Future<ProductGroup> fetchRabbitProducts();
}

class ProductsServiceImpl extends ProductsService {
  ProductsServiceImpl(Client client) : super(client);

  @override
  Future<ProductGroup> fetchRabbitProducts() async {
    int limit = 5;
    String featuredKey = "featured";

    //Rabbit
    QuerySnapshot foodSnapshot = await Firestore.instance.collection("products/rabbit/food")
        .limit(limit).where(featuredKey, isEqualTo: true).getDocuments();
    List<Product> foodProducts = parseProducts(foodSnapshot);

    // Grooming
    QuerySnapshot groomingSnapshot = await Firestore.instance.collection("products/rabbit/grooming")
        .limit(limit).where(featuredKey, isEqualTo: true).getDocuments();
    List<Product> groomingProducts = parseProducts(groomingSnapshot);

    // Toys
    QuerySnapshot toySnapshot = await Firestore.instance.collection("products/rabbit/toys")
        .limit(limit).where(featuredKey, isEqualTo: true).getDocuments();
    List<Product> toyProducts = parseProducts(toySnapshot);

    return ProductGroup(
      foodProducts: foodProducts,
      toyProducts: toyProducts,
      groomingProducts: groomingProducts,
    );
  }

  List<Product> parseProducts(QuerySnapshot snapshot) {
    List<Product> product = List();

    snapshot.documents.forEach((doc) {
      Map<String, dynamic> data = doc.data;
      print(data);
      product.add(Product(
        name: data["name"],
        description: data["description"],
        imageUrl: data["imageUrl"]
      ));
    });

    return product;
  }
}
