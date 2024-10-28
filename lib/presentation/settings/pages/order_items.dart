import 'package:flutter/material.dart';
import 'package:store_app/common/widgets/app_bar/app_bar.dart';
import 'package:store_app/presentation/settings/widgets/product_ordered_card.dart';
import '../../../domain/order/entities/product_ordered.dart';

class OrderItemsPage extends StatelessWidget {
  final List<ProductOrderedEntity> products;
  const OrderItemsPage({required this.products, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BasicAppbar(
          title: Text('Order Items'),
        ),
        body: _products());
  }

  Widget _products() {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return OrderItemCard(
            productOrderedEntity: products[index],
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemCount: products.length);
  }
}
