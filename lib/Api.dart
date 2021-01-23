import 'package:app_youtube/model/Video.dart';
import "package:http/http.dart" as http;
import "dart:convert";

// Chave gerada console.developers do google
const CHAVE_YOUTUBE_API = "AIzaSyALkcH6qmqHQ4BqzlH2-Fg2xfwWaEqqAi8";
const ID_CANAL = "UC0Da9RonsYYqh2WK_m61t2g";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

   pesquisar(String pesquisa)async{
    http.Response response = await http.get(
      URL_BASE + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$CHAVE_YOUTUBE_API"
      "&channelId=$ID_CANAL"
      "&q=$pesquisa"
    );


    if(response.statusCode == 200){
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map){
        return Video.fromJson(map);
      }).toList();

      for (var video in videos) {
          print('resultado: '+video.titulo);
      }
    }else {
      print("não foi realizado com sucesso");
    }
  }
}