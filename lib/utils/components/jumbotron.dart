import 'package:flutter/material.dart';
import 'package:jadwal_sholat/utils/colors/colorsPrimary.dart';

Widget Jumbotron(currentLocation,scheduler){
  return Container(
    height: 200,
    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 30),
    decoration: const BoxDecoration(
      color: Color(primary),
      borderRadius:BorderRadius.all(Radius.circular(15))
    ),

    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Image.asset('assets/gps.png',width: 20,height: 20,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child:Text(currentLocation,style: TextStyle(fontSize: 20, color: Colors.white,))
                ,
              )


            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${scheduler['title']}',style: TextStyle(fontSize: 30, color: Colors.white,fontFamily: 'Petrona'),),
                Text('${scheduler['time']}' ,style: TextStyle(fontSize: 15, color: Colors.white),),
              ],
            ),
          )

        ],
      ),
      Image.asset('assets/pray1.png')
    ],)
    ,
  );
}