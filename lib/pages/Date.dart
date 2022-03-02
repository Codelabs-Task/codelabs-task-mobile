import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jadwal_sholat/utils/colors/colorsPrimary.dart';

class Date extends StatefulWidget {
  final String title = '';

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {
  DateTime selectedDate = DateTime.now();
  String setDate = '';
  TextEditingController dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  navigatorDetailSchedule() {
    print('ok');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 50),
              decoration: const BoxDecoration(
                // color: Color(primary),
                borderRadius: BorderRadius.all(Radius.circular(15)),
                // boxShadow: [
                //   BoxShadow(
                //       offset: Offset(4, 4), color: Colors.black26, blurRadius: 8)
                // ]
              ),
              child: Column(
                children: [
                  Text('Pilih Tanggal'),
                  InkWell(
                    onTap: () {
                      _selectDate(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * .5,
                      height: MediaQuery.of(context).size.height * .07,
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(color: Colors.black26, blurRadius: 1)
                          ]),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                        enabled: false,
                        keyboardType: TextInputType.text,
                        controller: dateController,
                        onSaved: (val) {
                          print(val);
                          // setDate = val;
                        },
                        decoration: const InputDecoration(
                            disabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.only(top: 0.0)),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 20.0,),
                  Transform.translate(
                    offset: Offset(0, -35),
                    child: Text("${selectedDate.toLocal()}".split(' ')[0],
                        style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'Petrona',
                          color: Color(primary),
                        )),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 20.0,),

            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/detail', arguments: {'date':selectedDate.toLocal()});
              },
              iconSize: 70,
              icon: Image.asset('assets/next.png'),

            ),
          ],
        ),
      ),
    );
  }
}
