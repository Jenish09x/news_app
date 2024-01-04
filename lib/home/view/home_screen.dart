import 'package:flutter/material.dart';
import 'package:news_app/home/provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? providerR;
  HomeProvider? providerW;

  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getData();
  }

  @override
  Widget build(BuildContext context) {
    providerW = context.watch<HomeProvider>();
    providerR = context.read<HomeProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("24 News"),
        ),
        body: providerW!.homeModel == null
            ? const Center(child: Text("whait......"))
            : ListView.builder(
                itemCount: providerW!.homeModel!.articlesList!.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Image.network(providerW!
                          .homeModel!.articlesList![index].urlToImage ??
                      "https://resize.indiatvnews.com/en/centered/newbucket/1200_675/2020/08/breakingnews-live-blog-1568185450-1595123397-1597973758.jpg"),
                  title: Text(
                      "${providerW!.homeModel!.articlesList![index].title}"),
                  subtitle: Text(
                    "${providerW!.homeModel!.articlesList![index].content}",
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                ),
              ),
      ),
    );
  }
}
