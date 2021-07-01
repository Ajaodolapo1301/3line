
import 'package:intl/intl.dart';

class MyUtils {

  static formatDatefromTimeStamp(int timeStamp) {
    if (timeStamp == null) {
      return timeStamp ?? "";
    }

    var date = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);

    String fmtDatefromtimeStamp = DateFormat('E').format(date);
    return  "${fmtDatefromtimeStamp.toString()}";
  }


  static formatDate(date) {
    if (date == null) {
      return date ?? "";
    }

    var fmtDate = DateFormat.yMMMd().format(date);
//    String fmtDate = DateFormat('dd-MM-yyyy').format(DateTime.parse(date));


    return "${fmtDate.toString()}}";
  }

}