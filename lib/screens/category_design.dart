import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/category_item.dart';
import 'package:news_app/models/category_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryDesign extends StatelessWidget {
  Function onCategoryClick;
  var categoryModel = CategoryModel.getCategories();
  CategoryDesign({super.key, required this.onCategoryClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.categoryInterest,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(color: AppTheme.blackColor),
          ),
          const SizedBox(height: 10,),
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing:  20,
                  mainAxisSpacing: 20
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      onCategoryClick(categoryModel[index]);
                    },
                    child: CategoryItem(
                        categoryModel: categoryModel[index],
                        index: index),
                  );
                },
              itemCount: categoryModel.length,
            ),
          )
        ],
      ),
    );
  }
}
