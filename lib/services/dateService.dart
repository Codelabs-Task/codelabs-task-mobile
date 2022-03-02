
import 'package:intl/intl.dart';

class DateService{
  String datetime = '';

   getDate(){
    var now = DateTime.now();
    return convertDate(now, 'yyyy-MM-dd');
  }
  getTimeNow(){
    var now = DateTime.now();
    return convertDate(now, 'kk:mm');
  }
  getTimeBeetween(before,after){
     final date= getDate().split('-');
     final afterSplited=after.split(':');
     final beforeSplited=before.split(':');
     final afterDate = DateTime(
         int.parse(date[0]),
         int.parse(date[1]),
         int.parse(date[2]),
         int.parse(afterSplited[0]),
         int.parse(afterSplited[1]));
 final beforeDate = DateTime(
         int.parse(date[0]),
         int.parse(date[1]),
         int.parse(date[2]),
         int.parse(beforeSplited[0]),
         int.parse(before[1]));
     final minute = afterDate.difference(beforeDate).inMinutes;
     return minute;
     // after.to
  }
  getAllTime(data){
    final schedules =[];
    for(int i=0;i<data.length;i++){
      final schedule = DateService().getTimeBeetween(DateService().getTimeNow(),data[i]['time']);
      schedules.add(schedule);
    }
    return schedules;
  }
  convertTime(int value){
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString().padLeft(2, "0")} Jam ${minutes.toString().padLeft(2, "0")} Minute Lagi';
  }
  convertDate(date,String format){
    var formatter = DateFormat(format,"id_ID");
    return formatter.format(date);

  }

}