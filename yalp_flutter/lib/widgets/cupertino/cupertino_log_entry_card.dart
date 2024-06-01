import 'package:flutter/cupertino.dart';

import 'package:date_format/date_format.dart';
import 'package:yalp_core/yalp_core.dart';

import '../tag.dart';
import 'cupertino_log_entry_page.dart';

class CupertinoLogEntryCard extends StatelessWidget {
  const CupertinoLogEntryCard({
    super.key,
    required this.log,
  });

  final LogEntry log;

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        clipBehavior: Clip.antiAlias,
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(
            CupertinoPageRoute<void>(
              title: 'Log Viewer',
              builder: (context) => CupertinoLogEntryPage(entry: log),
            ),
          ),
          child: Container(
            color: CupertinoColors.secondarySystemGroupedBackground
                .resolveFrom(context),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    log.message,
                    style: theme.textTheme.textStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Text(
                        'Timestamp',
                        style: theme.textTheme.textStyle,
                      ),
                      const Spacer(),
                      Text(
                        formatDate(
                          log.timestamp,
                          [
                            ...[dd, '.', mm, '.', yyyy],
                            ' - ',
                            ...[HH, ':', nn, ':', ss, '.', SSS]
                          ],
                        ),
                        style: theme.textTheme.textStyle.copyWith(
                          color: CupertinoColors.secondaryLabel
                              .resolveFrom(context),
                          fontSize: switch (
                              theme.textTheme.textStyle.fontSize) {
                            final fontsize? => fontsize - 2,
                            _ => null,
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Text(
                        'Level',
                        style: theme.textTheme.textStyle,
                      ),
                      const Spacer(),
                      Tag(
                        color: switch (log.level) {
                          LogLevel.trace => CupertinoColors.systemGrey,
                          LogLevel.debug => CupertinoColors.systemBlue,
                          LogLevel.info => CupertinoColors.systemGreen,
                          LogLevel.warning => CupertinoColors.systemOrange,
                          LogLevel.error => CupertinoColors.systemRed,
                          LogLevel.fatal => CupertinoColors.systemPurple,
                        }
                            .resolveFrom(context),
                        value: log.level.name,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      if (log.tag case final tag?) Tag(value: tag),
                      Tag(
                        value: '${log.className}.${log.functionName}',
                        color: CupertinoColors.systemBlue.resolveFrom(context),
                      ),
                      if (log.invocation case final invocation?)
                        Tag(
                          value: invocation,
                          color:
                              CupertinoColors.systemPink.resolveFrom(context),
                        ),
                    ],
                  ),
                ),
                if (log.error case final error?)
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      '$error',
                      style: theme.textTheme.textStyle.copyWith(
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
                if (log.stackTrace case final stacktrace?
                    when (log.level == LogLevel.error ||
                        log.level == LogLevel.fatal ||
                        log.level == LogLevel.warning))
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: Text(
                      '$stacktrace'.trimRight(),
                      style: theme.textTheme.textStyle.copyWith(
                        fontFamily: 'monospace',
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
