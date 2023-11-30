import 'package:drift/native.dart';
import 'package:example_one/database/database.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart' as dr;

class SavedComics extends StatefulWidget {
  const SavedComics({super.key});

  @override
  State<SavedComics> createState() => _SavedComicsState();
}

class _SavedComicsState extends State<SavedComics> {
  final database = AppDatabase(NativeDatabase.memory());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Guardados", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Color(0xFFff5b5b),
      ),
      body: FutureBuilder(
          future: database.getListComics(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              List<ComicDBData>? comicsList = snapshot.data;
              return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: comicsList!.length,
                  itemBuilder: (context, index){
                    ComicDBData comic = comicsList[index];
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
                                              database.deleteComics(comic.id).then((value) {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SavedComics()));
                                              });
                                            },
                                            child: Text("ELIMINAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
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
        }else{ return Center(child: Text(snapshot.error.toString()),);}
      }),
    );
  }
}
