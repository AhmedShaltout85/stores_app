import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/product_provider.dart';
import '../utils/app_routes.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var productProvider = context.watch<ProductProvider>();

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   iconTheme: const IconThemeData(color: Colors.white),
      //   title: const Text(
      //     'Main Screen',
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body: productProvider.isLoading == false
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Search products...',
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      productProvider.searchProduct(value);
                    },
                    
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0),
                            ),
                          ),
                          child: GridTile(
                            footer: GridTileBar(
                              backgroundColor: Colors.black54,
                              title: Text(
                                productProvider.productList[index].title,
                                style: const TextStyle(fontSize: 12.0),
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            child: Image.network(
                                productProvider.productList[index].imageUrl,
                                fit: BoxFit.cover),
                          ),
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppRoutes.detailRouteName,
                              arguments: productProvider.productList[index]);
                        },
                      );
                    },
                    itemCount: productProvider.productList.length,
                  ),
                ),
              ],
            ),
    );
  }
}
