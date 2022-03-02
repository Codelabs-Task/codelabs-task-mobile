import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/Card.dart';

Widget Cards(List datas){

  return Expanded(
      child: SingleChildScrollView(
        child:  Container(
          height: 600,
          child: Column(
            children: [
              for (var el in datas) CardSchedule(data: el),
            ]
          ),
        ),
      ),
  );

}
