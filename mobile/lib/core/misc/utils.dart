DateTime shiftDate(DateTime date, {int year, int month, int day}) {
  return DateTime(
    date.year + (year ?? 0),
    date.month + (month ?? 0),
    date.day + (day ?? 0),
  );
}
