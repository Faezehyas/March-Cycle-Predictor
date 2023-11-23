class CyclePredictor {
  static List<DateTime> predictNextCycles(List<DateTime> startDates) {
    // Sort the dates to ensure they are in chronological order
    startDates.sort((a, b) => a.compareTo(b));

    // Calculate average cycle length
    final int averageCycleLength =
        ((startDates[1].difference(startDates[0]).inDays) +
                (startDates[2].difference(startDates[1]).inDays)) ~/
            2;

    // Predict next three cycles based on the most recent date and average cycle length
    final DateTime mostRecentDate = startDates.last;
    return List.generate(
        3,
        (index) => mostRecentDate
            .add(Duration(days: averageCycleLength * (index + 1))));
  }
}
