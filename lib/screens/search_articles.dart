import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/articles/article_items.dart';

class SearchArticles extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            showResults(context);
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isNotEmpty) {
      return FutureBuilder(
        future: ApiManager.searchArticles(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Something was wrong',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          } else if (snapshot.hasData) {
            List articles = snapshot.data ?? [];
            return Expanded(
                child: NotificationListener(
              child: ListView.builder(
                itemBuilder: (context, index) =>
                    ArticleItems(articles: articles[index]),
                itemCount: articles.length,
              ),
            ));
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            );
          }
        },
      );
    } else {
      return Text(
        'There is no search with this title',
        style: Theme.of(context).textTheme.titleMedium,
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return FutureBuilder(
        future: ApiManager.searchArticles(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Something was wrong',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            );
          } else if (snapshot.hasData) {
            List articles = snapshot.data!;
            return Expanded(
                child: NotificationListener(
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                    ArticleItems(articles: articles[index]),
                    itemCount: articles.length,
              ),
            ));
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppTheme.primaryColor,
              ),
            );
          }
        },
      );
    } else {
      return Text(
        'There is no search with this title',
        style: Theme.of(context).textTheme.titleMedium,
      );
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return AppTheme.lightTheme;
  }
}
