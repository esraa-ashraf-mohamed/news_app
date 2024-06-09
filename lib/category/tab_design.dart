import 'package:flutter/material.dart';
import 'package:news_app/articles/article_details.dart';
import 'package:news_app/category/tab_item.dart';
import 'package:news_app/models/sources_responses.dart';

class TabDesign extends StatefulWidget {
  List<Source> sources;

  TabDesign({required this.sources,super.key});

  @override
  State<TabDesign> createState() => _TabDesignState();
}

class _TabDesignState extends State<TabDesign> {
  int selectedIntex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              onTap: (value){
                selectedIntex = value;
                setState(() {});
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sources.map((source) => TabItems(
                  isSelected: selectedIntex == widget.sources.indexOf(source),
                  source: source)).toList(),
            ),
            // const SizedBox(height: 10,),
            Expanded(child: ArticleDetails(source: widget.sources[selectedIntex])),
          ],
        )
    );
  }
}
