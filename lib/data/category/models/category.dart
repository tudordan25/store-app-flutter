import 'dart:convert';

import 'package:store_app/domain/category/entity/category.dart';

class CategoryModel {
  final String title;
  final String categoryId;
  final String image;

  CategoryModel({
    required this.title,
    required this.categoryId,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'categoryId': categoryId,
      'image': image,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      title: map['title'],
      categoryId: map['categoryId'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      title: title,
      categoryId: categoryId,
      image: image,
    );
  }
}
