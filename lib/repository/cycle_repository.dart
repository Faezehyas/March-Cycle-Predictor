import 'package:march_cycle_predictor/models/cycle.dart';

class CycleRepository {
  // Placeholder for storing cycle data
  // In a real app, this might interact with a database or a remote server
  late Cycle _currentCycle;

  void saveCycle(Cycle cycle) {
    _currentCycle = cycle;
    // Save the cycle data to a database or cloud storage
  }

  Cycle getCycle() {
    return _currentCycle;
    // In a real app, this would retrieve data from a database or cloud storage
  }
}
