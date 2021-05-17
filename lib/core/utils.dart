abstract class Utils {

  static String shortDate(DateTime dateTime) {

    if(dateTime == null) return "Data não informada";

    String date = dateTime.toString().replaceAll("-", "/").substring(0, 10);
    return date.split("/").reversed.join("/");
  }

  static String age(DateTime birthDate) {

    if(birthDate == null) return "Data não informada";

    var days = DateTime.now().difference(birthDate).inDays / 365;
    return days.toInt().toString();
  }
}