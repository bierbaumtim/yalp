import 'package:flutter/material.dart';

import 'package:date_format/date_format.dart';

import 'package:yalp_core/yalp_core.dart';

class LogEntryCard extends StatelessWidget {
  const LogEntryCard({
    super.key,
    required this.log,
  });

  final LogEntry log;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
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
              trailing: _Tag(
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
                  if (log.tag case var tag?) _Tag(value: tag),
                  _Tag(
                    value: '${log.className}.${log.functionName}',
                    color: Colors.lightBlueAccent,
                  ),
                  if (log.invocation case var invocation?)
                    _Tag(value: invocation, color: Colors.pinkAccent),
                ],
              ),
            ),
            if (log.error case final error?)
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  '$error',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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

class _Tag extends StatelessWidget {
  final String value;
  final Color color;

  const _Tag({
    // ignore: unused_element
    super.key,
    required this.value,
    this.color = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        value,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
