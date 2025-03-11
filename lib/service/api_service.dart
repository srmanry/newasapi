 import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiService{

 Future<http.Response> getNews()async{


  String newsUrl = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=81aef6c5639b4f5cab92fa84c4c3bc5c";

http.Response getNewsData = await http.get(Uri.parse(newsUrl)) ;

return getNewsData;

 }

 }