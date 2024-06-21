import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/category/tab_design.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/models/sources_responses.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../screens/settings/locale_provider.dart';

class CategoryDetails extends StatefulWidget {

  static const String routName = 'category';
  CategoryModel categoryModel;
  CategoryDetails({super.key, required this.categoryModel});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocaleProvider>(context);

    return FutureBuilder<SourcesResponses?>(
        future: ApiManager.getSources(widget.categoryModel.id, provider.currentLocale),
        builder: (context, snapshot){
          /// loading to connection with server
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            );
          }
          /// i has error
          else if(snapshot.hasError){
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.wrong,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 15,),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) => AppTheme.primaryColor)
                    ),
                      onPressed: (){
                      ApiManager.getSources(widget.categoryModel.id, provider.currentLocale);
                      setState(() {});
                      },
                      child: Text(
                        AppLocalizations.of(context)!.tryAgain,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppTheme.whiteColor),
                      ))
                ],
              ),
            );
          }
          /// server error
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data?.message ??AppLocalizations.of(context)!.wrong),
                ElevatedButton(
                    onPressed: (){},
                    child: Text(AppLocalizations.of(context)!.tryAgain))
              ],
            );
          }
          /// server success
          else{
            return TabDesign(
                sources: snapshot.data!.sources!,
            );
          }
        },
    );
  }
}
