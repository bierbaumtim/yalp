
import 'dart:io';
import 'dart:isolate';

import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

mixin DatabaseBackgroundMixin on GeneratedDatabase {
  String get dbFileName;

  static Future<DriftIsolate> createMoorIsolate(String databaseFileName) async {
    // this method is called from the main isolate. Since we can't use
    // getApplicationDocumentsDirectory on a background isolate, we calculate
    // the database path in the foreground isolate and then inform the
    // background isolate about the path.
    final filename = '$databaseFileName.sqlite';
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, filename);

    final receivePort = ReceivePort();

    await Isolate.spawn(
      _startBackground,
      _IsolateStartRequest(receivePort.sendPort, path),
    );

    // _startBackground will send the MoorIsolate to this ReceivePort
    return await receivePort.first as DriftIsolate;
  }

  static void _startBackground(_IsolateStartRequest request) {
    // this is the entry point from the background isolate! Let's create
    // the database from the path we received
    final executor = NativeDatabase(File(request.targetPath));
    // we're using MoorIsolate.inCurrent here as this method already runs on a
    // background isolate. If we used MoorIsolate.spawn, a third isolate would be
    // started which is not what we want!
    final moorIsolate = DriftIsolate.inCurrent(
      () => DatabaseConnection(executor),
    );
    // inform the starting isolate about this, so that it can call .connect()
    request.sendMoorIsolate.send(moorIsolate);
  }
}

// used to bundle the SendPort and the target path, since isolate entry point
// functions can only take one parameter.
class _IsolateStartRequest {
  final SendPort sendMoorIsolate;
  final String targetPath;

  _IsolateStartRequest(this.sendMoorIsolate, this.targetPath);
}