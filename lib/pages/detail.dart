import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jadwal_sholat/services/dateService.dart';
import 'package:jadwal_sholat/services/gpsService.dart';
import 'package:jadwal_sholat/utils/containers/cards.dart';

import '../services/apiService.dart';

class Detail extends StatefulWidget {
  const Detail({
    required this.args,
    Key? key
  }) : super(key: key);
  final args ;
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
   List data=[];
  void firstLoad() async {
    List location = await LocationService().getCurrentLocation();
    final date = DateService().convertDate(widget.args['date'], 'yyyy-MM-dd');

    String url ='https://api.pray.zone/v2/times/day.json?longitude=${location[0]}&latitude=${location[1]}&elevation=333&date=${date}';
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
    print(data);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstLoad();
    data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            const Text('Jadwal Shalat ',
                style: TextStyle(
                fontSize: 40,
                fontFamily: 'Petrona',
                fontWeight: FontWeight.bold,

            ),
            ),
            Text('Tanggal ${DateService().convertDate(widget.args['date'],'dd MMMM  yyyy')}',
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Petrona',
                fontWeight: FontWeight.bold,

              ),
            ),
            Cards(data)
          ],
        ),
      ),
    );
  }
}
