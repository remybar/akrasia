DateTime shiftDate(DateTime date, {int year, int month, int day}) {
  return DateTime(
    date.year + (year ?? 0),
    date.month + (month ?? 0),
    date.day + (day ?? 0),
  );
}

extension DateTimeX on DateTime {
  bool isBeforeOrEqual(DateTime d) {
    return isBefore(d) || isAtSameMomentAs(d);
  }

  bool isAfterOrEqual(DateTime d) {
    return isAfter(d) || isAtSameMomentAs(d);
  }
}
