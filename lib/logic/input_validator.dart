class InputValidator {
  /// validate user-input to be in correct date format
  static String? inputDateValidator(String? date) {
    if (date == null || date.isEmpty) {
      return 'input date is invalid';
    }
    try {
      final DateTime? parsedDate = DateTime.tryParse(date);
      return parsedDate!.isBefore(DateTime.now())
          ? null
          : 'input date is invalid';
    } catch (e) {
      return 'input date is invalid';
    }
  }

  /// validate all three dates
  static bool areValidDates(List<String?> dates) {
    return dates.every((date) => inputDateValidator(date) == null);
  }

  /// validate `average cycle length` in days
  static String? inputDayValidator(String? day) {
    if (day == null || day.isEmpty) {
      return 'input day is invalid';
    } else if ((int.tryParse(day) ?? 0) <= 0) {
      return 'input day should be greater than 0';
    }
    return null;
  }
}
