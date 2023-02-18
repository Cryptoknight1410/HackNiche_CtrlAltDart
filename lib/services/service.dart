
import 'dart:convert';
import 'package:http/http.dart' as http;

class NewsModel {
  String? title;
  String? link;
  String? description;
  String? pubDate;
  String? imageUrl;

  NewsModel({
     this.title,
     this.link,
     this.description,
     this.pubDate,
     this.imageUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title'],
      link: json['link'],
      description: json['description'],
      pubDate: json['pubDate'],
      imageUrl: json['image_url'],
    );
  }
}

NewsModel newsModelFromJson(Map<String, dynamic> json) => NewsModel.fromJson(json);
Future<List<NewsModel>> fetchNewsData(String country, String cat) async {
  final response = await http.get(Uri.parse('https://newsdata.io/api/1/news?apikey=pub_17276d1361e00861288dd3f14403ba5a9c98a&country=in&category=${cat}&language=en'));

  if (response.statusCode == 200) {
    final dynamic newsJson = jsonDecode(response.body);

    List ListOfNews = newsJson['results'] as List;
    print(ListOfNews[0]);
    List<NewsModel> result = ListOfNews.map((e) => NewsModel.fromJson(e)).toList();
    return result;
  } else {
    throw Exception('Failed to load news data');
  }
}
