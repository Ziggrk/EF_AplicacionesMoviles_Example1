import 'package:example_one/model/comic.dart';

class ListComics{
  static List<Comic> list(List<dynamic> listJson){
    List<Comic> listComics=[];
    if(listJson!=null){
      for(var u in listJson){
        final comic = Comic.objJson(u);
        listComics.add(comic);
      }
    }
    return listComics;
  }
}