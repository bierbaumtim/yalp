import 'package:flutter/material.dart';
import 'package:yalp_core/yalp_core.dart';

class MaterialLogViewer extends StatefulWidget {
  const MaterialLogViewer({super.key});

  @override
  State<MaterialLogViewer> createState() => _MaterialLogViewerState();
}

class _MaterialLogViewerState extends State<MaterialLogViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Viewer'),
      ),
      body: FutureBuilder(
        future: Logger.root.logStorage.getAllLogs(),
        initialData: const <LogEntry>[],
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final logs = snapshot.data as List<LogEntry>;

            return ListView.builder(
              itemCount: logs.length,
              itemBuilder: (context, index) {
                final log = logs[index];

                return ListTile(
                  title: Text(log.message),
                  subtitle: Text(log.timestamp.toIso8601String()),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
