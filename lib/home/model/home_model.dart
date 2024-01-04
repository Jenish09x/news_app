class HomeModel {
  String? status;
  int? totalResults;
  List<Articles>? articlesList;

  HomeModel({this.status, this.totalResults, this.articlesList});

  factory HomeModel.mapToModel(Map m1) {
    List l1= m1['articles'];
    return HomeModel(
      status: m1['status'],
      totalResults: m1['totalResults'],
      articlesList: l1.map((e) => Articles.mapToModel(e)).toList(),
    );
  }
}

class Articles {
  dynamic author, title, description, url, urlToImage, publishedAt, content;
  SourceModel? source;

  Articles(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.source});

  factory Articles.mapToModel(Map m1) {
    return Articles(
      author: m1['author'],
      title: m1['title'],
      description: m1['description'],
      url: m1['url'],
      urlToImage: m1['urlToImage'],
      publishedAt: m1['publishedAt'],
      content: m1['content'],
      source: SourceModel.mapToModel(m1["source"])
    );
  }
}

class SourceModel {
  dynamic id;
  String? name;

  SourceModel({this.id, this.name});

  factory SourceModel.mapToModel(Map m1) {
    return SourceModel(
      id: m1['id'],
      name: m1['name'],
    );
  }
}
