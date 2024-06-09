import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/models/artical_responses.dart';
import 'package:news_app/models/sources_responses.dart';

// https://newsapi.org/v2/top-headlines/sources?apiKey=API_Key

class ApiManager{

  static Future<SourcesResponses?> getSources(String categoryId)async{
    Uri url = Uri.https(ApiConstants.baseApi,ApiConstants.sourceApi,
        {
          'apiKey' : 'd7e63820d7c54ba98eb603a2dfa4e9b0',
          'category' : categoryId
        });
    try{
      var response = await http.get(url);
      var responseBody = response.body;       /// string
      var json = jsonDecode(responseBody);    /// string ==> json

      return SourcesResponses.fromJson(json);
    }catch(e){
      rethrow;
    }
  }

  // https://newsapi.org/v2/everything?q=bitcoin&apiKey=d7e63820d7c54ba98eb603a2dfa4e9b0

  static Future<ArticleResponses?> getArticles(String sourceId)async{
    Uri url = Uri.https(ApiConstants.baseApi, ApiConstants.articleApi,
      {
        'apiKey' : 'd7e63820d7c54ba98eb603a2dfa4e9b0',
        'sources' : sourceId
      }
    );
    try{
      var response = await http.get(url);
      var responseBody = response.body;       /// string
      var json = jsonDecode(responseBody);    /// string ==> json

      return ArticleResponses.fromJson(json);
    }catch(e){
      rethrow;
    }
  }

  static Future<List<Articles>> searchArticles(String query)async{
    Uri url = Uri.https(ApiConstants.baseApi, ApiConstants.articleApi,
        {
          'q' : query,
          'apiKey' : 'd7e63820d7c54ba98eb603a2dfa4e9b0'
        }
    );
    var response = await http.get(url);

    List<Articles> articles = [];

    if(response.statusCode == 200){
      var json = jsonDecode(response.body);
      List art = json['articles'];
      for(var element in art){
        articles.add(Articles.fromJson(element));
      }
      return articles;
    }
    else{
      throw Exception("There are error!");
    }
  }
}