import 'package:yalp_core/yalp_core.dart';
import 'package:test/test.dart';

void main() {
  group('Logger', () {
    final logger = Logger();
    final storage = InMemoryStorage();

    setUpAll(() {
      Logger.root.logStorage = storage;
    });

    setUp(() {
      storage.clearLogs();
    });

    test('Log each method', () {
      final lc = LogContext.tracked(className: 'test', functionName: 'test');

      logger.trace('trace', stacktrace: StackTrace.current);
      logger.debug('debug');
      logger.info('info');
      logger.warning('warning');
      logger.error('error', context: lc);
      logger.fatal('fatal', context: lc);

      expect(storage.getAllLogs(), completion(hasLength(6)));
    });
  });

  group('InMemoryStorage', () {});
}
