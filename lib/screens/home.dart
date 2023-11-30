import 'package:example_one/preference/preferences.dart';
import 'package:example_one/screens/comics_view.dart';
import 'package:example_one/screens/saved_comics.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Preferences preferences = Preferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7,
              image: AssetImage('assets/logo.png')
          ),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.7,
            child: FilledButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.all(8),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        side: BorderSide(color: Colors.white)
                    )
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ComicsView()));
                },
                child: Text("VER COMICS", style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))
            ),
          ),
          Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.7,
            child: FilledButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.all(8),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      side: BorderSide(color: Colors.white)
                  )
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SavedComics()));
              },
              child: Text("GUARDADOS", style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),),),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Switch(
                    value: preferences.flexeando,
                    activeTrackColor: Colors.redAccent,
                    onChanged: (value) {
                      setState(() {
                        preferences.flexeando = value;
                        preferences.updatePreference();
                      });
                    }
                ),
                Text("Flexeando que si se.")
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState(){
    preferences.init().then((value) {
      setState(() {
        preferences = value;
      });
    });
  }
}
