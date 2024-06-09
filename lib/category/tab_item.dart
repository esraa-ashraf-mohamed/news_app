import 'package:flutter/material.dart';
import 'package:news_app/app_theme.dart';
import 'package:news_app/models/sources_responses.dart';

class TabItems extends StatelessWidget {
  bool isSelected;
  Source source;
  TabItems ({super.key, required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          border: Border.all(
              width: 2,
              color: AppTheme.primaryColor
          ),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          color: isSelected ? AppTheme.primaryColor : Colors.transparent
      ),
      child: Text(
        source.name ?? '',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        color: isSelected ? AppTheme.whiteColor : AppTheme.primaryColor
      ),
      ),
    );
  }
}
