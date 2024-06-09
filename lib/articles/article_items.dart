import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/artical_responses.dart';

class ArticleItems extends StatelessWidget {
  Articles articles;
  ArticleItems({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: CachedNetworkImage(
              imageUrl: articles.urlToImage!,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            articles.author ??'',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: AppTheme.grayColor
            ),
          ),
          const SizedBox(height: 8,),
          Text(
            articles.title ??'',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8,),
          Text(
            textAlign: TextAlign.end,
            articles.publishedAt ??'',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppTheme.grayColor
            ),
          )
        ],
      ),
    );
  }
}
