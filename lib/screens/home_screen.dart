import 'package:flutter/material.dart';
import 'package:news_app/app_constants.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/home_drawer/home_drawer.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/screens/category_design.dart';
import 'package:news_app/screens/search_articles.dart';
import 'package:news_app/screens/settings/settings_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[
        Container(
          color: AppTheme.whiteColor,
          child: Image.asset(
            AppConstants.backgroundImage,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
        Scaffold(
          drawer: Drawer(
            child: HomeDrawer(onTap:onDrawerClick),
          ),
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed:(){
                  showSearch(context: context,
                      delegate: SearchArticles());
                },
                  icon: const Icon(Icons.search,))
            ],
            title: Text(
              choiceNum == 2 ?
                  AppLocalizations.of(context)!.settings:
                  selectedCategory == null ?
              AppLocalizations.of(context)!.newsApp :
                      selectedCategory!.id,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: choiceNum == 2 ?
              const SettingsScreen()
              :
          selectedCategory == null ?
          CategoryDesign(onCategoryClick: onCategoryClick) :
          CategoryDetails(categoryModel: selectedCategory!),
        ),
      ]
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryClick(CategoryModel newSelectedCategory ){
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  int choiceNum = HomeDrawer.categories;
  void onDrawerClick(int newChoiceNum){
     choiceNum = newChoiceNum;
     selectedCategory = null;
     Navigator.pop(context);
    setState(() {});
  }
}
