//main Model
class NewsModel {
  String? status;
  int? totalResults;
  List<ArticlesModel>? articlesList;


  NewsModel({this.status, this.totalResults, this.articlesList});

  factory NewsModel.mapToModel(Map m1)
  {
    List l1=m1['articles'];
    return NewsModel(
      status: m1['status'],
      totalResults: m1['totalResults'],
      articlesList: l1.map((e) => ArticlesModel.mapToModel(e)).toList(),
    );
  }
}

//articles Model
class ArticlesModel {
  String? author, title, description, url, urlToImage, publishedAt, content;
  SourceModel? source;

  ArticlesModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.source});

  factory ArticlesModel.mapToModel(Map m1) {
    return ArticlesModel(
        author: m1['author'],
        title: m1['title'],
        description: m1['description'],
        url: m1['url'],
        urlToImage: m1['urlToImage'],
        publishedAt: m1["publishedAt"],
        content: m1['content'],
        source: SourceModel.mapToModel(m1['source']));
  }
}

//Source Model
class SourceModel {
  dynamic id;
  String? name;

  SourceModel({this.id, this.name});

  factory SourceModel.mapToModel(Map m1) {
    return SourceModel(name: m1['name'], id: m1['id']);
  }
}
