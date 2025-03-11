import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:newsapi/future/home/model/model1.dart';
import 'package:newsapi/future/home/model/news_model.dart';

class HomeController extends GetxController {
  final String apiKey = "81aef6c5639b4f5cab92fa84c4c3bc5c";
  final String baseUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch";
  final String url1 = "https://newsapi.org/v2/top-headlines?sources=techcrunch";

  var newsList = <NewsApiDataModel>[].obs;
  //var trendignNewsList =[].obs;
  var isLoading = false.obs;
  var errorMessage = "".obs;
  RxList<NewsApiDataModel> treandingNewsList = <NewsApiDataModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    //fetchNewsData();
    getTrendingNews();
  }
/*

  Future<void> fetchNewsData() async {
    isLoading.value = true;
    errorMessage.value = "";

    try {
      final response = await http.get(Uri.parse("$baseUrl&apiKey=$apiKey"));

      if (response.statusCode == 200) {
        final newsData = jsonDecode(response.body);


        newsList.value=(newsData["articles"]as List).map((article)=>NewsApiDataModel.fromJson(article)).toList();

        //newsList.value = (newsData["articles"] as List)
        //    .map((article) => NewsApiDataModel.fromJson(article)).toList()
           // NewsModelData.fromJson(article))
           // .toList();
      } else {
        errorMessage.value = "Failed to load news. Status Code: ${response.statusCode}";
      }
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }
*/



  Future<void> getTrendingNews()async{

    var baseUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=81aef6c5639b4f5cab92fa84c4c3bc5c";
    var response = await http.get(Uri.parse(baseUrl));
    print(response);

    print("LLLLLLLLLLLLLLLLLL");


    try{

      if(response.statusCode ==200){
        final trendingNews = jsonDecode(response.body);
        print(trendingNews);
        var articals = trendingNews["articles"];
        for(var news in articals){
          treandingNewsList.add(NewsApiDataModel.fromJson(news));
        }
      }
      else{
        print("Not Data Found");
      }
    }catch(e){
      print(e);
    }
  }
}


