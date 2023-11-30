import 'package:example_one/model/comic.dart';
import 'package:flutter/material.dart';

class ComicDetails extends StatefulWidget {
  const ComicDetails({super.key, required this.comic});
  final Comic comic;
  @override
  State<ComicDetails> createState() => _ComicDetailsState();
}

class _ComicDetailsState extends State<ComicDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        centerTitle: true,
        title: Text("Marvelitas", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        backgroundColor: Color(0xFFff5b5b),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10)
              ),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${widget.comic.title}", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("UPC", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 12)),
                      Text(widget.comic.upc.isNotEmpty?"${widget.comic.upc}":"None", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 10),),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text("Page count: ", style: TextStyle(color: Colors.white, fontSize: 12)),
                                  Text("${widget.comic.pageCount}", style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("Creators:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.comic.creators!.length,
                      itemBuilder: (context, index){
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text("${widget.comic.creators[index].name}", style: TextStyle(fontSize: 12, color: Colors.white),),
                      );
                      }),
                ],
              )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(10)
            ),
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Stories:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15)),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.comic.stories!.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text("${widget.comic.stories[index].name}", style: TextStyle(fontSize: 12, color: Colors.white),),
                          );
                        }),
                  ],
                )
            ),
          ),
        ],
      )
    );
  }
}
