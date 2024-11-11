// product_list.dart
import 'package:flutter/material.dart';
import 'product.dart'; // Import the Product class
import 'product_detail.dart'; // Import the ProductDetail class

class ProductList extends StatelessWidget {
  final List<Product> products = [
    Product(
      id: 1,
      name: 'Laptop',
      description: 'Laptop gaming dengan spesifikasi tinggi.',
      price: 1200.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: 2,
      name: 'Smartphone',
      description: 'Smartphone dengan kamera terbaik.',
      price: 800.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Product(
      id: 3,
      name: 'Headphone',
      description: 'Headphone noise-cancelling.',
      price: 150.0,
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.network(product.imageUrl),
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetail(product: product),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
