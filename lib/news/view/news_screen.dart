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
  TextEditingController txtNews = TextEditingController();

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
        body: Column(
          children: [
            // SearchBar(
            //   controller: txtNews,
            //   trailing: Icon(Icons.search),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: TextField(
            //     controller: txtNews,
            //     decoration: const InputDecoration(
            //       border: OutlineInputBorder(),
            //     ),
            //
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SearchBar(
                controller: txtNews,
                leading: const Icon(Icons.search),
                onSubmitted: (value) {
                  providerR!.SearchData(txtNews.text);
                  providerR!.getNews();
                },
              ),
            ),
            providerW!.newsModel == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: providerW!.newsModel!.articlesList!.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            leading: Image.network(providerW!
                                    .newsModel!.articlesList![index].urlToImage ??
                                "https://www.topgear.com/sites/default/files/news-listicle/image/2023/01/1.jpeg?w=827&h=465"),
                            title: Text(
                                providerW!.newsModel!.articlesList![index].title ??
                                    "Tesla, Inc., American manufacturer of electric automobiles, solar panels, and batteries for cars and home power storage. It was founded in 2003",
                                overflow: TextOverflow.ellipsis),
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
