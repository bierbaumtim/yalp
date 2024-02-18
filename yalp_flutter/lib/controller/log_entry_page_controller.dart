import 'package:flutter/foundation.dart';

import 'package:yalp_core/yalp_core.dart';

class LogEntryPageController extends ChangeNotifier {
  final LogEntry _entry;

  bool _isLoadingConnectedLogs = false;
  List<LogEntry> _connectedLogs = [];

  LogEntry get entry => _entry;
  bool get isLoadingConnectedLogs => _isLoadingConnectedLogs;
  List<LogEntry> get connectedLogs => _connectedLogs;

  LogEntryPageController({
    required LogEntry entry,
  }) : _entry = entry {
    if (entry.invocation != null) {
      _fetchConnectedLogs();
    }
  }

  Future<void> _fetchConnectedLogs() async {
    if (_entry.invocation case final invocation?) {
      _isLoadingConnectedLogs = true;
      notifyListeners();

      _connectedLogs = await Logger.root.logStorage.getLogsForInvocation(
        invocation,
      );

      _isLoadingConnectedLogs = false;
      notifyListeners();
    }
  }
}
