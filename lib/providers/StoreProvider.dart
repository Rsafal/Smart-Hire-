import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StoreProvider extends ChangeNotifier {
  StoreProvider() {
    fetchProducts();
  }
  List<Product> products = [
    new Product(
        "Kshitij Raj", "Backend Developer", "assets/Icons/DS Front.png", 1000),
    new Product("preetish patel", "cp,web developer,noob gamer",
        "assets/Icons/DS Back.png", 5000,
        featured: true),
    new Product("Divya Uchenya", "Maa Behen Ak Kar Dene Wali",
        "assets/Icons/DSA Front.png", 100),
    new Product("Ayushman Dutta", "Tension ki Dukan",
        "assets/Icons/DWT Front.png", 1000),
    new Product("Rana Safal", "Head developer,all skills",
        "assets/Icons/ESDS Front.png", 10000000,
        featured: true),
    new Product(
        "Shivam sharma", "Sticker Specialist", "assets/Icons/Pal.png", 4000,
        featured: true),
  ];

  Future<void> fetchProducts() async {
    await FirebaseFirestore.instance.collection('Products').get().then((value) {
      value.docs.forEach((doc) {
        Product product = new Product(doc['name'], doc['description'],
            doc['image'], double.parse(doc['price'].toString()),
            featured: doc['featured']);
        products.add(product);
      });
    });
    notifyListeners();
  }

  void updateCart(Product p) {
    products.forEach((element) {
      if (element.name == p.name) {
        element.addedToCart = !element.addedToCart;
        notifyListeners();
      }
    });
  }

  Future<void> purchase() async {
    //Payment Logic
  }
}

class Product {
  String name;
  String description;
  String image;
  double price;
  bool featured;
  bool addedToCart;
  Product(this.name, this.description, this.image, this.price,
      {this.featured = false, this.addedToCart = false});
}
