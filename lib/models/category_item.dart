import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
  int index;
  CategoryItem({super.key, required this.categoryModel, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(25),
          topRight: const Radius.circular(25),
          bottomRight: Radius.circular(
            index % 2 == 0 ? 25 : 0
          ),
          bottomLeft: Radius.circular(
              index % 2 != 0 ? 25 : 0
          ),
        ),
        color: categoryModel.backgroundColor,
      ),
      child: Column(
        children: [
          Image.asset(categoryModel.imageName,
          height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(categoryModel.title, style: Theme.of(context).textTheme.titleLarge,),
        ],
      ),
    );
  }
}
