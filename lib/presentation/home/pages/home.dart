import 'package:flutter/material.dart';
import 'package:store_app/presentation/home/widgets/categories.dart';
import 'package:store_app/presentation/home/widgets/header.dart';
import 'package:store_app/presentation/home/widgets/new_in.dart';
import 'package:store_app/presentation/home/widgets/search_field.dart';
import 'package:store_app/presentation/home/widgets/top_selling.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Header(),
            ),
            const SizedBox(height: 24),
            const SearchField(),
            const SizedBox(height: 24),
            const Categories(),
            const SizedBox(height: 24),
            const TopSelling(),
            const SizedBox(height: 24),
            const NewIn(),
          ],
        ),
      ),
    );
  }
}
