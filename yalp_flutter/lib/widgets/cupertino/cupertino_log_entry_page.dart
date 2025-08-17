import 'package:flutter/cupertino.dart';

import 'package:date_format/date_format.dart';
import 'package:yalp_core/yalp_core.dart';

import '../../controller/log_entry_page_controller.dart';
import '../tag.dart';
import 'cupertino_log_entry_card.dart';

class CupertinoLogEntryPage extends StatefulWidget {
  final LogEntry entry;

  const CupertinoLogEntryPage({
    super.key,
    required this.entry,
  });

  @override
  State<CupertinoLogEntryPage> createState() => _CupertinoLogEntryPageState();
}

class _CupertinoLogEntryPageState extends State<CupertinoLogEntryPage> {
  late final LogEntryPageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = LogEntryPageController(entry: widget.entry);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'Details',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.list_bullet),
            label: 'Connected Logs',
          ),
        ],
      ),
      tabBuilder: (context, index) => switch (index) {
        0 => _LogEntryDetails(controller: _controller),
        1 => _ConnectedLogs(controller: _controller),
        _ => const Placeholder(),
      },
    );
  }
}

class _LogEntryDetails extends StatelessWidget {
  final LogEntryPageController controller;

  const _LogEntryDetails({
    // ignore: unused_element_parameter
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = CupertinoTheme.of(context);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Details'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                'Message',
                style: theme.textTheme.navTitleTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                controller.entry.message,
                style: theme.textTheme.textStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Text(
                    'Level',
                    style: theme.textTheme.textStyle,
                  ),
                  const Spacer(),
                  Tag(
                    color: switch (controller.entry.level) {
                      LogLevel.trace => CupertinoColors.systemGrey,
                      LogLevel.debug => CupertinoColors.systemBlue,
                      LogLevel.info => CupertinoColors.systemGreen,
                      LogLevel.warning => CupertinoColors.systemOrange,
                      LogLevel.error => CupertinoColors.systemRed,
                      LogLevel.fatal => CupertinoColors.systemPurple,
                    }
                        .resolveFrom(context),
                    value: controller.entry.level.name,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Text(
                    'Timestamp',
                    style: theme.textTheme.textStyle,
                  ),
                  const Spacer(),
                  Text(
                    formatDate(
                      controller.entry.timestamp,
                      [
                        ...[dd, '.', mm, '.', yyyy],
                        ' - ',
                        ...[HH, ':', nn, ':', ss, '.', SSS]
                      ],
                    ),
                    style: theme.textTheme.textStyle,
                  ),
                ],
              ),
            ),
            if (controller.entry.tag case final tag?)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Text(
                      'Tag',
                      style: theme.textTheme.textStyle,
                    ),
                    const Spacer(),
                    Tag(value: tag),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Text(
                    'Function',
                    style: theme.textTheme.textStyle,
                  ),
                  const Spacer(),
                  Tag(
                    color: CupertinoColors.systemBlue.resolveFrom(context),
                    value:
                        '${controller.entry.className}.${controller.entry.functionName}',
                  ),
                ],
              ),
            ),
            if (controller.entry.invocation case final invocation?)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    Text(
                      'Invocation',
                      style: theme.textTheme.textStyle,
                    ),
                    const Spacer(),
                    Tag(
                      color: CupertinoColors.systemPink.resolveFrom(context),
                      value: invocation,
                    ),
                  ],
                ),
              ),
            if (controller.entry.error case final error?) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  'Error',
                  style: theme.textTheme.navTitleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  '$error',
                  style: theme.textTheme.textStyle.copyWith(
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ],
            if (controller.entry.stackTrace case final stacktrace?) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  'Stacktrace',
                  style: theme.textTheme.navTitleTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  '$stacktrace'.trimRight(),
                  style: theme.textTheme.textStyle.copyWith(
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ConnectedLogs extends StatelessWidget {
  final LogEntryPageController controller;

  const _ConnectedLogs({
    // ignore: unused_element_parameter
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Connected Logs'),
      ),
      child: AnimatedBuilder(
        animation: controller,
        builder: (context, _) {
          if (controller.isLoadingConnectedLogs) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          return ListView.builder(
            itemCount: controller.connectedLogs.length,
            itemBuilder: (context, index) => CupertinoLogEntryCard(
              log: controller.connectedLogs[index],
            ),
          );
        },
      ),
    );
  }
}
