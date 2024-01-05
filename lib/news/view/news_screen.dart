import 'package:flutter/material.dart';
import 'package:news_app/news/provider/news_provider.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsProvider? providerR;
  NewsProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<NewsProvider>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    providerR = context.read<NewsProvider>();
    providerW = context.watch<NewsProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("24 News"),
        ),
        body: providerW!.newsModel == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: providerW!.newsModel!.articlesList!.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Image.network(providerW!
                          .newsModel!.articlesList![index].urlToImage ??
                      "https://stimg.cardekho.com/images/carexteriorimages/630x420/Tesla/Model-3/5251/1693556345148/front-left-side-47.jpg?impolicy=resize&imwidth=220"),
                  title: Text(providerW!
                          .newsModel!.articlesList![index].title ??
                      "Tesla, Inc., American manufacturer of electric automobiles, solar panels, and batteries for cars and home power storage. It was founded in 2003"),
                ),
              ),
      ),
    );
  }
}
