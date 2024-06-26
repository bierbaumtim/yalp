import 'package:flutter/material.dart';

import 'package:date_format/date_format.dart';
import 'package:yalp_core/yalp_core.dart';

import '../../controller/log_entry_page_controller.dart';
import 'log_entry_card.dart';
import '../tag.dart';

class LogEntryPage extends StatefulWidget {
  final LogEntry entry;

  const LogEntryPage({
    super.key,
    required this.entry,
  });

  @override
  State<LogEntryPage> createState() => _LogEntryPageState();
}

class _LogEntryPageState extends State<LogEntryPage>
    with SingleTickerProviderStateMixin {
  late final LogEntryPageController _controller;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();

    _controller = LogEntryPageController(entry: widget.entry);
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Details'),
            Tab(text: 'Connected Logs'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _LogEntryDetails(
            controller: _controller,
          ),
          _ConnectedLogs(
            controller: _controller,
          ),
        ],
      ),
    );
  }
}

class _LogEntryDetails extends StatelessWidget {
  final LogEntryPageController controller;

  const _LogEntryDetails({
    // ignore: unused_element
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      children: [
        const ListTile(
          title: Text('Message'),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            controller.entry.message,
          ),
        ),
        ListTile(
          title: const Text('Level'),
          trailing: Tag(
            color: switch (controller.entry.level) {
              LogLevel.trace => Colors.grey,
              LogLevel.debug => Colors.blue,
              LogLevel.info => Colors.green,
              LogLevel.warning => Colors.orange,
              LogLevel.error => Colors.red,
              LogLevel.fatal => Colors.purple,
            },
            value: controller.entry.level.name,
          ),
        ),
        ListTile(
          title: const Text('Timestamp'),
          trailing: Text(
            formatDate(
              controller.entry.timestamp,
              [
                ...[dd, '.', mm, '.', yyyy],
                ' - ',
                ...[HH, ':', nn, ':', ss, '.', SSS]
              ],
            ),
          ),
        ),
        if (controller.entry.tag case final tag?)
          ListTile(
            title: const Text('Tag'),
            trailing: Tag(value: tag),
          ),
        ListTile(
          title: const Text('Function'),
          trailing: Tag(
            value:
                '${controller.entry.className}.${controller.entry.functionName}',
            color: Colors.lightBlueAccent,
          ),
        ),
        if (controller.entry.invocation case final invocation?)
          ListTile(
            title: const Text('Invocation'),
            trailing: Tag(value: invocation, color: Colors.pinkAccent),
          ),
        if (controller.entry.error case final error) ...[
          const ListTile(
            title: Text('Error'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(
              '$error',
              style: theme.textTheme.bodyMedium?.copyWith(
                fontFamily: 'monospace',
              ),
            ),
          ),
        ],
        if (controller.entry.stackTrace case final stacktrace) ...[
          const ListTile(
            title: Text('Stacktrace'),
          ),
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
      ],
    );
  }
}

class _ConnectedLogs extends StatelessWidget {
  final LogEntryPageController controller;

  const _ConnectedLogs({
    // ignore: unused_element
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        if (controller.isLoadingConnectedLogs) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
          itemCount: controller.connectedLogs.length,
          itemBuilder: (context, index) => LogEntryCard(
            log: controller.connectedLogs[index],
          ),
        );
      },
    );
  }
}
