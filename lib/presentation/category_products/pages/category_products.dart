import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/common/bloc/product/products_display_cubit.dart';
import 'package:store_app/common/bloc/product/products_display_state.dart';
import 'package:store_app/common/widgets/app_bar/app_bar.dart';
import 'package:store_app/common/widgets/product/product_card.dart';
import 'package:store_app/domain/category/entity/category.dart';
import 'package:store_app/domain/product/entities/product.dart';
import 'package:store_app/domain/product/usecases/get_products_by_category_id.dart';
import 'package:store_app/service_locator.dart';

class CategoryProductsPage extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryProductsPage({
    required this.categoryEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => ProductsDisplayCubit(useCase: sl<GetProductsByCategoryId>())..displayProducts(params: categoryEntity.categoryId),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductsLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _cateogryInfo(state.products),
                    const SizedBox(height: 10),
                    _products(state.products),
                  ],
                ),
              );
            }

            return Container();
          },
        ),
      ),
    );
  }

  Widget _cateogryInfo(List<ProductEntity> products) {
    return Text(
      '${categoryEntity.title} (${products.length})',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
        itemBuilder: (context, index) {
          return ProductCard(productEntity: products[index]);
        },
      ),
    );
  }
}
