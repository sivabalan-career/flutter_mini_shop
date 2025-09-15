import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Product.dart';
import '../util/Constants.dart';
// import '../util/ProductFilterByProductScreen.dart';

class ProductScreen extends StatefulWidget {
  final String title;

  const ProductScreen({super.key, required this.title});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(Constants.BASE_URL + Constants.PRODUCT_ROUTE),
      );

      print(response.body.toString());

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data'];

        setState(() {
          products = data.map((data) => Product.fromJson(data)).toList();
        });
      } else {
        throw Exception(
          'Failed to load Products ' + Constants.BASE_URL + Constants.PRODUCT_ROUTE,
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  void navigateToProductScreen(Product selectedProduct) {
    // navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => ProductFilterBYProductScreen(title: selectedProduct.name, Product: selectedProduct),
    //   ),
    //
    // );
  }

  Future<void> onRefresh() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              fetchData();
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: products.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: ListTile(
                title: Text(
                  products[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
