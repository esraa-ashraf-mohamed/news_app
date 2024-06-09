import 'dart:ui';

import 'package:news_app/app_constants.dart';
import 'package:news_app/app_theme.dart';

class CategoryModel{
  String id;
  String title;
  String imageName;
  Color backgroundColor;

  CategoryModel({required this.id, required this.title,
    required this.imageName, required this.backgroundColor});

  static List<CategoryModel> getCategories(){
    return [
      CategoryModel(
          id: 'sports',
          title: 'Sports',
          imageName: AppConstants.sports,
          backgroundColor: AppTheme.redColor
      ),
      CategoryModel(
          id: 'politics',
          title: 'Politics',
          imageName: AppConstants.politics,
          backgroundColor: AppTheme.darkBlueColor
      ),
      CategoryModel(
          id: 'health',
          title: 'Health',
          imageName: AppConstants.health,
          backgroundColor: AppTheme.pinkColor
      ),
      CategoryModel(
          id: 'business',
          title: 'Business',
          imageName: AppConstants.business,
          backgroundColor: AppTheme.brownColor
      ),
      CategoryModel(
          id: 'environment',
          title: 'Environment',
          imageName: AppConstants.environment,
          backgroundColor: AppTheme.blueColor
      ),
      CategoryModel(
          id: 'science',
          title: 'Science',
          imageName: AppConstants.science,
          backgroundColor: AppTheme.yellowColor
      )
    ];
  }
}