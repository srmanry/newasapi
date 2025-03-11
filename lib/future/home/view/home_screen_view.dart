import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:newsapi/future/home/controller/home_controller.dart';
import 'package:newsapi/future/home/model/news_model.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Headlines")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (controller.errorMessage.isNotEmpty) {
          return Center(child: Text(controller.errorMessage.value));
        }
        return Column(
          children: [
            SizedBox(
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (_,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue[100]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text("Category")),
                    ),
                  ),
                );
              }),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: controller.treandingNewsList.length,
                itemBuilder: (context, index) {
                  final news = controller.treandingNewsList[index];
                  return Padding(
                    padding:  EdgeInsets.all(8.0),
                    child: SizedBox(

                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height :300,width: double.infinity,
                            child: Image(image: NetworkImage(news.urlToImage,),
                              fit: BoxFit.cover,
                              ),
                          ),
                           // SizedBox(width: 15,),
                        //  Text(news.,style: TextStyle(fontSize: 18,),),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(news.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                          ),
                          Text(news.description,style: TextStyle(fontSize: 18,),),
                          SizedBox(height: 10,)
                        ],
                      ),
                    ),
                  );
               //  return Text(controller.treandingNewsList[index].articl);
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}

class NewsDetailView extends StatelessWidget {
  final Article article;

  NewsDetailView({required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(article.title)),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article.urlToImage.isNotEmpty)
              Image.network(article.urlToImage),
            SizedBox(height: 10),
            Text(article.title, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(article.content),
          ],
        ),
      ),
    );
  }
}
