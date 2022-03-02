import 'package:flutter/material.dart';
import 'package:jadwal_sholat/services/apiService.dart';
import 'package:jadwal_sholat/services/dateService.dart';
import 'package:jadwal_sholat/services/gpsService.dart';
import 'package:jadwal_sholat/utils/components/jumbotron.dart';
import 'package:jadwal_sholat/utils/containers/cards.dart';
import 'dart:convert';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data = [];
  String currentLocation='Lokasi Saat Ini';
   Object scheduler={};
  void firstLoad() async {

    List location = await LocationService().getCurrentLocation();

    String url ='https://api.pray.zone/v2/times/day.json?longitude=${location[0]}&latitude=${location[1]}&elevation=333&date=${DateService().getDate()}';
    final results = jsonDecode(await ApiService().getData(url));
    data = [
       {
         'title':'Subuh',
         'time':results['results']['datetime'][0]['times']['Sunrise'],
         'icon':'subuh.png'
       },
      {
        'title':'Dzuhur',
        'time':results['results']['datetime'][0]['times']['Dhuhr'],
        'icon':'dzuhur.png'
      }, {
        'title':'Ashar',
        'time':results['results']['datetime'][0]['times']['Asr'],
        'icon':'ashar.png'
      }, {
        'title':'Magrib',
        'time':results['results']['datetime'][0]['times']['Maghrib'],
        'icon':'magrib.png'
      }, {
        'title':'Isya',
        'time':results['results']['datetime'][0]['times']['Isha'],
        'icon':'isya.png'
      }
    ];
    //update schedule praying
    List schedulesSorted = DateService().getAllTime(data);
    schedulesSorted.sort((a,b)=>b.compareTo(a));
    int indexOfTime =DateService().getAllTime(data).indexWhere((element) => element==schedulesSorted[0]);
    final time = DateService().convertTime(DateService().getTimeBeetween(DateService().getTimeNow(),data[indexOfTime]['time']));
    print(DateService().getAllTime(data));
    print(indexOfTime);
    scheduler= {'time':time,'title':data[indexOfTime]['title']};
    print(time);
    //update location info
    String uri=  'https://api.opencagedata.com/geocode/v1/json?q=${location[1]}+${location[0]}&key=3ba626bd58cb4d6691d9b64ae8bc45b6';
    final address = jsonDecode(await ApiService().getData(uri));
    currentLocation =  await address['results'][0]['components']['subdistrict'];

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstLoad();
    // updateJumbotron();
    data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          margin: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Jumbotron(currentLocation,scheduler),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Jadwal Hari Ini",
                style: TextStyle(fontSize: 30),
              ),
              Cards(data),
              const SizedBox(height: 10),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/date');
              }, child: Text("lihat Jadwal Lain"))
            ],
          ),
        ),
      );
  }
}
