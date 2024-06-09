import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {

  Function onTap;
  static const int categories = 1;
  static const int settings = 2;

  HomeDrawer({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppTheme.primaryColor,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.newsApp,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              InkWell(
                onTap: (){
                  onTap(categories);
                },
                child: Row(
                  children: [
                    const Icon(Icons.list, size: 40,),
                    const SizedBox(width: 10,),
                    Text(AppLocalizations.of(context)!.categories,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),)
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              InkWell(
                onTap: (){
                  onTap(settings);
                },
                child: Row(
                  children: [
                    const Icon(Icons.settings, size: 40,),
                    const SizedBox(width: 10,),
                    Text(AppLocalizations.of(context)!.settings,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 22),)
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
