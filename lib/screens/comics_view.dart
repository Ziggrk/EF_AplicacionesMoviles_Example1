import 'package:drift/native.dart';
import 'package:example_one/database/database.dart';
import 'package:example_one/model/comic.dart';
import 'package:example_one/network/service.dart';
import 'package:example_one/screens/comic_detail.dart';
import 'package:example_one/screens/saved_comics.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as dr;

class ComicsView extends StatefulWidget {
  const ComicsView({super.key});
  @override
  State<ComicsView> createState() => _ComicsViewState();
}

class _ComicsViewState extends State<ComicsView> {
  final database=AppDatabase(NativeDatabase.memory());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Marvelitas", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Color(0xFFff5b5b),
      ),
      body: FutureBuilder(
        initialData: [],
          future: ComicService.getComics(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot){
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                  Comic comic=snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,  vertical: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${comic.title}", style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("UPC", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10)),
                                      Text(comic.upc.isNotEmpty?"${comic.upc}":"None", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10),),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              child: Row(
                                                children: [
                                                  Text("Page count: ", style: TextStyle(color: Colors.white, fontSize: 10)),
                                                  Text("${comic.pageCount}", style: TextStyle(color: Colors.white, fontSize: 10,fontWeight: FontWeight.bold),)
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(right: 4.0),
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor: Colors.redAccent,
                                                  primary: Colors.white,
                                                  padding: const EdgeInsets.all(8),
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                                    side: BorderSide(color: Colors.white)
                                                  )
                                              ),
                                              onPressed: (){
                                                database.postComics( ComicDBCompanion(
                                                  id: dr.Value(comic.id),
                                                  title: dr.Value(comic.title),
                                                  upc: dr.Value(comic.upc),
                                                  pageCount: dr.Value(comic.pageCount)
                                                )).then((value) {Navigator.push(context, MaterialPageRoute(builder: (context)=> SavedComics()));});
                                              },
                                              child: Text("GUARDAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 4.0),
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor: Colors.redAccent,
                                                  primary: Colors.white,
                                                  padding: const EdgeInsets.all(8),
                                                  shape: const RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                                      side: BorderSide(color: Colors.white)
                                                  )
                                              ),
                                              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> ComicDetails(comic: comic)));},
                                              child: Text("VER MÁS", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          })
    );
  }
}
