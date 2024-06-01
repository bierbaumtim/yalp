import 'package:flutter/material.dart';

import 'package:date_format/date_format.dart';
import 'package:yalp_core/yalp_core.dart';

import '../tag.dart';
import 'log_entry_page.dart';

class LogEntryCard extends StatelessWidget {
  const LogEntryCard({
    super.key,
    required this.log,
  });

  final LogEntry log;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (context) => LogEntryPage(entry: log),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ListTile(
              title: Text(log.message),
              subtitle: Text(
                formatDate(
                  log.timestamp,
                  [
                    ...[dd, '.', mm, '.', yyyy],
                    ' - ',
                    ...[HH, ':', nn, ':', ss, '.', SSS]
                  ],
                ),
              ),
              trailing: Tag(
                color: switch (log.level) {
                  LogLevel.trace => Colors.grey,
                  LogLevel.debug => Colors.blue,
                  LogLevel.info => Colors.green,
                  LogLevel.warning => Colors.orange,
                  LogLevel.error => Colors.red,
                  LogLevel.fatal => Colors.purple,
                },
                value: log.level.name,
              ),
              mouseCursor: SystemMouseCursors.click,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  if (log.tag case final tag?) Tag(value: tag),
                  Tag(
                    value: '${log.className}.${log.functionName}',
                    color: Colors.lightBlueAccent,
                  ),
                  if (log.invocation case final invocation?)
                    Tag(value: invocation, color: Colors.pinkAccent),
                ],
              ),
            ),
            if (log.error case final error?)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  '$error',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            if (log.stackTrace case final stacktrace?
                when (log.level == LogLevel.error ||
                    log.level == LogLevel.fatal ||
                    log.level == LogLevel.warning))
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  '$stacktrace'.trimRight(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontFamily: 'monospace',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
