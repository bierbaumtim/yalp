# YALP - Yet Another Logging Package

## Introduction
YALP is a logging package for Dart and Flutter that provides a simple and flexible way to log messages in your applications.

## Features
- Easy to use API
- Support for different log levels
- Contextual logging
- Tagging
- Builtin UI

## Installation
To use YALP in your Dart project, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  yalp_core: ^1.0.0
  yalp_isar_storage: ^1.0.0 # For persisting the logs
  yalp_flutter: ^1.0.0 # Builtin UI
```

## Packages
| Package | Description |
|---|---|
| yalp_core |  |
| yalp_isar_storage | |
| yalp_flutter | |

## Usage
### Setup
To use the Logger you need to setup and initialize the Logger. Add the following lines of code in your app startup.

```dart
import 'package:yalp_core/yalp_core.dart';

...

await Logger.root.init(IsarLogStorage(), KeepAll());
```

This initializes the log storage and applies the provided retention policy.

### Logging
To log something you can either use `Logger.root` or create a new Logger instance. The Logger has a method for each of the following logging level: `trace, debug, info, warning, error, fatal`.

```dart
Logger.root.info('Something happend');

or

final logger = Logger();
logger.info('Something happend');
```

Each log method accepts the following optional arguments:

| Argument | Description |
| --- | --- |
| Object? error | The exception or error object. |
| StrackTrace? stackTrace | Stacktrace of the exception or custom stacktrace. |
| String? tag | Custom tag to group or mark a log message |
| LogContext? context| details in the next part |

**Contextual logging**

The base `LogContext` gives you the option to specify the `className` and `functionName` which should be saved in the log. If none is provided both names are extracted from the stackTrace.

The more interesting `LogContext` is the `TrackedLogContext` which enables you to group and associate logs. Every time you create a new `TrackedLogContext` a new v4 UUID is generated and stored in the context and later also in each log entry itself. 

Each `TrackedLogContext` can also have a parent `TrackedLogContext`. This enables you to group logs with arbitrary nesting. This is pretty usefull when logging parallel methods.

```dart
final logger = Logger();

// Uses current stacktrace to extract class and function name 
final lc1 = LogContext();
logger.info('Something happend', context: lc1);

// Class and function names are provided in the constructor
final lc2 = LogContext(className: 'Test', functionName: 'run');
final logger.info('Something happend', context: lc2);

// Single tracked context
final lc3 = LogContext.tracked();
logger.info('Something happend', context: lc3);
logger.warning('Something could be wrong here', context: lc3);

// Nested tracked contexts
final lc4 = LogContext.tracked();

logger.info('Something happend', context: lc4);

final lc5 = lc4.nested();
logger.warning('Something does not look right', context: lc5);

logger.fatal('Oh no its crashed', context: lc4);

```

### UI
To show the logs you simple import `yalp_flutter` and use the `MaterialLogViewer` widget (`CupertinoLogViewer` coming soon...).