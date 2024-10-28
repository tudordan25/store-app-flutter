import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/common/bloc/product/products_display_cubit.dart';
import 'package:store_app/common/bloc/product/products_display_state.dart';
import 'package:store_app/common/widgets/app_bar/app_bar.dart';
import 'package:store_app/common/widgets/product/product_card.dart';
import 'package:store_app/domain/product/entities/product.dart';
import 'package:store_app/domain/product/usecases/get_favorites_products.dart';
import 'package:store_app/service_locator.dart';

class MyFavoritesPage extends StatelessWidget {
  const MyFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        title: Text('My Favorites'),
      ),
      body: BlocProvider(
        create: (context) => ProductsDisplayCubit(useCase: sl<GetFavoritesProductsUseCase>())..displayProducts(),
        child: BlocBuilder<ProductsDisplayCubit, ProductsDisplayState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProductsLoaded) {
              return _products(state.products);
            }
            if (state is LoadProductsFailure) {
              return const Text('Please try again');
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget _products(List<ProductEntity> products) {
    return Expanded(
      child: GridView.builder(
        itemCount: products.length,
        padding: const EdgeInsets.all(16),
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
