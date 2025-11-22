import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../../utils/app_routes.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        // leading: article.hasImage
        leading: Image.network(
          product.imageUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.article, size: 40);
          },
        ),
        // : const Icon(Icons.article, size: 40),
        title: Text(
          product.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(product.category,
                style: const TextStyle(fontSize: 12, color: Colors.blueGrey)),
            // Text(article.formattedDate),
            Text(
              product.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        onTap: () {
          // Navigate to article detail
          Navigator.pushNamed(
            context,
            AppRoutes.detailRouteName,
            arguments: product,
          );
        },
      ),
    );
  }
}
