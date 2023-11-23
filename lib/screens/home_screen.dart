import 'package:flutter/material.dart';
import 'package:march_cycle_predictor/widgets/input_field.dart';
import 'package:march_cycle_predictor/widgets/error_dialog.dart';
import 'package:march_cycle_predictor/logic/input_validator.dart';
import 'package:march_cycle_predictor/logic/cycle_predictor.dart';
import 'package:march_cycle_predictor/screens/result_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final TextEditingController _cycle1Controller = TextEditingController();
  final TextEditingController _cycle2Controller = TextEditingController();
  final TextEditingController _cycle3Controller = TextEditingController();
  final TextEditingController _averageCycleLengthController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey();

  void _predictCycles() {
    if (!InputValidator.areValidDates([
      _cycle1Controller.text,
      _cycle2Controller.text,
      _cycle3Controller.text
    ])) {
      showDialog(
        context: context,
        builder: (_) =>
            ErrorDialog(message: "Invalid input. Please check your data."),
      );
      return;
    }

    final List<DateTime> startDates = [
      DateTime.parse(_cycle1Controller.text),
      DateTime.parse(_cycle2Controller.text),
      DateTime.parse(_cycle3Controller.text),
    ];

    final List<DateTime> predictedDates =
        CyclePredictor.predictNextCycles(startDates);

    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (_) => ResultScreen(predictedDates: predictedDates)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('March Cycle Predictor'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InputField(
                label: 'Last Cycle 1 Start Date (YYYY-MM-DD)',
                controller: _cycle1Controller,
                validator: (value) => InputValidator.inputDateValidator(value),
              ),
              const SizedBox(height: 16.0),
              InputField(
                label: 'Last Cycle 2 Start Date (YYYY-MM-DD)',
                controller: _cycle2Controller,
                validator: (value) => InputValidator.inputDateValidator(value),
              ),
              const SizedBox(height: 16.0),
              InputField(
                label: 'Last Cycle 3 Start Date (YYYY-MM-DD)',
                controller: _cycle3Controller,
                validator: (value) => InputValidator.inputDateValidator(value),
              ),
              const SizedBox(height: 16.0),
              InputField(
                label: 'Average Cycle Length (in days)',
                controller: _averageCycleLengthController,
                validator: (value) => InputValidator.inputDayValidator(value),
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                child: const Text('Predict Next Cycles'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _predictCycles();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
