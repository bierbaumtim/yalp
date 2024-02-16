import 'logger.dart';

mixin Loggable {
  Logger? _logger;

  Logger get logger => _logger ??= Logger();
}
