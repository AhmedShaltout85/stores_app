import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/product_provider.dart';
import '../utils/app_routes.dart';
import 'widgets/product_card.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var productProvider = context.watch<ProductProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.blue),
        title: const Text(
          'Product App',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
            fontSize: 15.0,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () =>
                Navigator.pushNamed(context, AppRoutes.mainRouteName),
            // Provider.of<ProductProvider>(context, listen: false)
            //     .getProductData(),
          ),
        ],
      ),
      body: productProvider.isLoading == false
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
             
                Container(
                  alignment: Alignment.center,
                  color: Colors.grey[200],
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        productProvider.getCategoryProductData(
                            productProvider.categoryProductList[index]);
                      },
                      child: Card(
                        color: Colors.blueAccent,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 11.0, vertical: 8.0),
                          child: Text(
                            productProvider.categoryProductList[index],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    itemCount: productProvider.categoryProductList.length,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: productProvider.productList.length,
                    itemBuilder: (context, index) {
                      final product = productProvider.productList[index];
                      return ProductCard(product: product);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}



