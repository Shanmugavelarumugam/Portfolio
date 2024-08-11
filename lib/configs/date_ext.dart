extension DateOnly on DateTime {
  /// Returns a new [DateTime] instance with the time set to midnight
  DateTime get startOfDay => DateTime(year, month, day);
}
