//import 'dart:js';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:passmate/poi.dart';
import 'package:passmate/remote_services.dart';

void main() {
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: non_constant_identifier_names
  PointOfInterest? pointofinterest;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //fetch data from API
    getData();
  }

  getData() async {
    pointofinterest = (await RemoteService().getPoi()) as PointOfInterest?;
    if(pointofinterest != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          )
        ],

      ),
      body: Container(
        child: Stack(
          children: [
            Container(
         child: 
          FlutterMap( 
            options: MapOptions(
              center: latlng.LatLng(28.472,-81.471,),
              maxBounds: LatLngBounds(
                latlng.LatLng(28.467,-81.464),
                latlng.LatLng(28.477, -81.478),
              ),
              zoom: 17.2,
              maxZoom: 18.0,
              rotation: 90
            ),
            children: [
              SizedBox(height: 150, child: const DecoratedBox(decoration: const BoxDecoration(color: Colors.red),),),
              TileLayer(
                urlTemplate: 'https://api.mapbox.com/styles/v1/passmate/ckyaksv1x06iq14p0i2tsx0ux/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoicGFzc21hdGUiLCJhIjoiY2t4enExNnhzMnZsMjJvcDY1YWloaGNkdCJ9.5VlS7VGzbL-sUaU8XKi16Q',
                additionalOptions: {
                  'accessToken': 'pk.eyJ1IjoicGFzc21hdGUiLCJhIjoiY2t4enExNnhzMnZsMjJvcDY1YWloaGNkdCJ9.5VlS7VGzbL-sUaU8XKi16Q',
                  'id': 'passmate.ctl4ikw5'
                },
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: latlng.LatLng(pointofinterest!.latitude,pointofinterest!.longitude),
                    width: 30,
                    height: 30,
                    rotate: true,
                    builder: (context) => Image.asset('assets/thrill_ride.png'),
                    anchorPos: AnchorPos.align(AnchorAlign.none)
                  )
                ],
              )
            ]
        )),
                          Container(
              child:
              SizedBox(height: 136, width: 450, child: const DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,colors : [Colors.white,Color(0x00ffffff)])),),),
            ),
            Container(
              child:             
              Positioned(
                top: 60,
                left: 25,
                right: 25,
                child: Material(
                  elevation: 16,
                  shadowColor: Color(0xff455B63),
                  borderRadius: BorderRadius.circular(17),
                  child: TextField (
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Image.asset('assets/Frame.png'),
                      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 0),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                        borderSide: BorderSide(width: 1, color: Colors.white)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                        borderSide: BorderSide(width: 1, color: Colors.white)),
                      hintText: 'Where to?',
                    )
                    ),
                ),
              )
            )
        ],
      )
    ));
  }
}