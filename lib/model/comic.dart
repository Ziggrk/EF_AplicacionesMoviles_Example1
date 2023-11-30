import 'package:example_one/model/creator.dart';
import 'package:example_one/model/story.dart';

class Comic {
  int id;
  String title;
  String upc;
  int pageCount;
  List<Creator> creators;
  List<Story> stories;

  Comic({
    required this.id,
    required this.title,
    required this.upc,
    required this.pageCount,
    required this.creators,
    required this.stories
  });

  static Comic objJson(Map<String, dynamic> json) {

    List<Creator> listCreators = [];
    List<Story> listStories = [];
    if (json['creators']['items'] != null) {
      for(var u in json['creators']['items']){
        final creator = Creator.objJson(u);
        listCreators.add(creator);
      }
    }
    if (json['stories']['items'] != null) {
      for(var u in json['stories']['items']){
        final story = Story.objJson(u);
        listStories.add(story);
      }
    }
    return Comic(
      id: json['id'] as int,
      title: json['title'] as String,
      upc: json['upc'] as String,
      pageCount: json['pageCount'] as int,
      creators: listCreators,
      stories: listStories

    );
  }
}