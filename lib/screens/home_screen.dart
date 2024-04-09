import 'package:flutter/material.dart';
import 'package:news_app/app_constants.dart';
import 'package:news_app/app_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String routName = 'homeScreen';

  const HomeScreen({super.key});

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
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){},
              icon: Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                onPressed:(){},
                  icon: const Icon(Icons.search))
            ],
            title: Text('News App',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
      ]
    );
  }
}
