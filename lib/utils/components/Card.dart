import 'package:flutter/material.dart';
import 'package:jadwal_sholat/utils/colors/colorsPrimary.dart';


class CardSchedule extends StatelessWidget {

  const CardSchedule({
    required this.data,
  }) ;

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
          color: const Color(seccondary),
          boxShadow: const [
            BoxShadow(
                offset: Offset(4, 4), color: Colors.black26, blurRadius: 4)
          ],
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //  icon
          Container(
            width: 200,
            child: Row(
              children: [
                Image.asset('assets/${data['icon']}'),
                Container(
                 margin: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                    Text('${data['title']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Petrona',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                    ),
                    Text('${data['time']}',style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Petrona',
                      fontWeight: FontWeight.bold,
                    ),
                    )
                  ],),
                ),
              ],
            ),
          ),

          Image.asset('assets/pray2.png')
        ],
      ),
    );
  }
}
