class DateTimeConverter{

  String timestampToDateTimeString(int timestampInSeconds) {
    int timestampInMilliseconds = timestampInSeconds * 1000;
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestampInMilliseconds);
    String period = dateTime.hour < 12 ? 'AM' : 'PM';
    int hour = dateTime.hour % 12;
    hour = hour == 0 ? 12 : hour;
    String formattedDateTime = "${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}   ${hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')} $period";
    return formattedDateTime;
  }
}