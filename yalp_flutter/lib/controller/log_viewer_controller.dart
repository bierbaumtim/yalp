import 'package:flutter/foundation.dart';

import 'package:yalp_core/yalp_core.dart';

class LogViewController extends ChangeNotifier {
  static const int _limit = 100;

  bool _isLoading = true;
  bool _isFetchingMore = false;
  List<LogEntry> _logs = [];
  List<LogLevel> _usedLevel = [];
  List<String> _usedTags = [];
  List<String> _usedClassnames = [];

  // Filter
  List<LogLevel> _filterLevels = [];
  List<String> _filterTags = [];
  List<String> _filterClassnames = [];
  DateTime? _filterStartDate;
  DateTime? _filterEndDate;

  bool get isLoading => _isLoading;
  bool get isFetchingMore => _isFetchingMore;
  List<LogEntry> get logs => _logs;
  List<LogLevel> get usedLevel => _usedLevel;
  List<String> get usedTags => _usedTags;
  List<String> get usedClassnames => _usedClassnames;

  List<LogLevel> get filterLevels => _filterLevels;
  List<String> get filterTags => _filterTags;
  List<String> get filterClassnames => _filterClassnames;
  DateTime? get filterStartDate => _filterStartDate;
  DateTime? get filterEndDate => _filterEndDate;

  set filterLevels(List<LogLevel> levels) {
    _filterLevels = levels;
    notifyListeners();

    _refetchLogs();
  }

  set filterTags(List<String> tags) {
    _filterTags = tags;
    notifyListeners();

    _refetchLogs();
  }

  set filterClassnames(List<String> classnames) {
    _filterClassnames = classnames;
    notifyListeners();

    _refetchLogs();
  }

  void setTimespanFilter(DateTime? start, DateTime? end) {
    _filterStartDate = start;
    _filterEndDate = end;
    notifyListeners();

    _refetchLogs();
  }

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    _usedLevel = await Logger.root.logStorage.getLevels();
    _usedTags = await Logger.root.logStorage.getTags();
    _usedClassnames = await Logger.root.logStorage.getClassnames();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadLogs() async {
    _isLoading = true;
    notifyListeners();

    try {
      _logs = await Logger.root.logStorage.getLogsFiltered(
        const LogFilterOptions(limit: _limit),
      );
    } catch (e) {
      _logs = [];
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> loadMore() async {
    _isFetchingMore = true;
    notifyListeners();

    try {
      final logs = await Logger.root.logStorage.getLogsFiltered(
        LogFilterOptions(
          limit: _limit,
          offset: _logs.length,
          level: _filterLevels,
          tags: _filterTags,
          classnames: _filterClassnames,
          start: _filterStartDate,
          end: _filterEndDate,
        ),
      );

      _logs.addAll(logs);
    } catch (e) {
      // Do nothing
    }

    _isFetchingMore = false;
    notifyListeners();
  }

  Future<LogStatistics> getStats() => Logger.root.logStorage.getStatistics();

  Future<void> _refetchLogs() async {
    _isLoading = true;
    notifyListeners();

    try {
      _logs = await Logger.root.logStorage.getLogsFiltered(
        LogFilterOptions(
          limit: _limit,
          level: _filterLevels,
          tags: _filterTags,
          start: _filterStartDate,
          end: _filterEndDate,
        ),
      );
    } catch (e) {
      _logs = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
