import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:clone_youtube_flutter/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyCO4LJLA-cj_snoLvvv6MnKA99ybQ7u7VU";
const ID_CANAL = "UC8butISFwT-Wl7EV0hUK0BQ";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>>pesquisar(String pesquisa) async {
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
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode( response.body );
      List<Video> videos = dadosJson["items"].map<Video>(
          (map){
            return Video.fromJSON(map);
          }
      ).toList();

      return videos;

       // for( var video in dadosJson["items"] ){
       //
       //   print("Resultado video: " + video.toString());
       // }

      // print("Resultado: " + dadosJson["items"].toString());
    }else{

    }
  }
}