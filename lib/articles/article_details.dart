import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/articles/article_items.dart';
import 'package:news_app/models/artical_responses.dart';
import 'package:news_app/models/sources_responses.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../screens/settings/locale_provider.dart';

class ArticleDetails extends StatefulWidget {
  Source source;
  ArticleDetails({super.key, required this.source});

  @override
  State<ArticleDetails> createState() => _ArticleDetailsState();
}

class _ArticleDetailsState extends State<ArticleDetails> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LocaleProvider>(context);
    return FutureBuilder<ArticleResponses?>(
        future: ApiManager.getArticles(widget.source.id ?? '', provider.currentLocale),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            );
          }
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
                        ApiManager.getArticles(widget.source.id ??'', provider.currentLocale);
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
          if(snapshot.data?.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data?.message ?? AppLocalizations.of(context)!.wrong),
                ElevatedButton(
                    onPressed: (){
                      ApiManager.getArticles(widget.source.id ??'', provider.currentLocale);
                      setState(() {});
                    },
                    child: Text(AppLocalizations.of(context)!.tryAgain))
              ],
            );
          }
          else{
            return ListView.builder(
                itemBuilder: (context, index) {
                  return ArticleItems(articles: snapshot.data!.articles![index]);
                },
              itemCount: snapshot.data?.articles?.length,
            );
          }
        },
    );
  }
}
