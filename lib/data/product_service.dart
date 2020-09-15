import 'package:bloc_sample/models/product.dart';

class ProductService {
  static List<Product> products = new List<Product>();

  static ProductService _singleton = ProductService._internal();

  factory ProductService(){
    return _singleton;
  }

  ProductService._internal();

  static List<Product> getAll(){
    products.add(new Product(1, "Acer Laptop", 6000));
    products.add(new Product(2, "Acer Laptop", 6000));
    products.add(new Product(3, "Acer Laptop", 6000));
    return products;
  }
}