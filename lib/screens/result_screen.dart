import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final List<DateTime> predictedDates;

  ResultScreen({required this.predictedDates});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Predicted Cycles'),
      ),
      body: ListView.builder(
        itemCount: predictedDates.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Cycle ${index + 1}'),
            subtitle: Text('Start Date: ${predictedDates[index].toIso8601String().split('T')[0]}'),
          );
        },
      ),
    );
  }
}
