import 'package:flutter/material.dart';
import 'package:covid19/pages/Listshow.dart';
import 'package:covid19/pages/Country.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:covid19/Dataloader.dart' as R;

class Worldwide extends StatefulWidget {
  final value;
  final info;
  final List countries;
  final Map map;
  Worldwide({@required this.value, this.info, this.countries, this.map});

  @override
  _WorldwideState createState() => _WorldwideState();
}

class _WorldwideState extends State<Worldwide> {
  R.Router r = new R.Router();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var _pages = [
      ListShow(value: widget.value, info: widget.info,),
      Countrydata(value: widget.value, info: widget.info, countries: widget.countries, map: widget.map,),
    ];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Container(),
        backgroundColor: Colors.black,
        title: Image(
          image: AssetImage('assets/images/image.png'),
          height: 52,
        ),
        actions: <Widget>[
          TextButton(
            child: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () => r.route(context),
          )
        ],
      ),
      body: _pages[index],
      bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (i) {
              setState(() {
                index = i;
              });
            },
            backgroundColor: Colors.black,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.globe, color: Colors.white,),
                label: "World Report", // title: Text("World Report", style: TextStyle(color: Colors.white),)
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidMap, color: Colors.white,),
                label: "Country Report", //title: Text("Country Report", style: TextStyle(color: Colors.white),)
              ),
            ]
          )
    );
  }
}
