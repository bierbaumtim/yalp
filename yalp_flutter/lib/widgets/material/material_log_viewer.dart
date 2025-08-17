import 'package:flutter/material.dart';

import 'package:yalp_core/yalp_core.dart';

import '../../controller/log_viewer_controller.dart';
import 'filter_selection_chip.dart';
import 'log_entry_card.dart';
import 'timespan_filter_chip.dart';

class MaterialLogViewer extends StatefulWidget {
  const MaterialLogViewer({super.key});

  @override
  State<MaterialLogViewer> createState() => _MaterialLogViewerState();
}

class _MaterialLogViewerState extends State<MaterialLogViewer> {
  late final LogViewController _controller;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _controller = LogViewController();
    _controller.init().then((_) => _controller.loadLogs());

    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Viewer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _controller.refetchLogs(),
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart_rounded),
            onPressed: () => showModalBottomSheet(
              context: context,
              showDragHandle: true,
              enableDrag: true,
              builder: (context) => _LogStatsBottomsheet(
                controller: _controller,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: SizedBox(
            height: 48,
            child: _FilterBar(controller: _controller),
          ),
        ),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          if (_controller.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (_controller.logs.isEmpty) {
            return const Center(
              child: Text('No logs found'),
            );
          } else {
            return NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollEndNotification) {
                  if (notification.metrics.pixels >=
                          notification.metrics.maxScrollExtent - 100 &&
                      !_controller.isFetchingMore) {
                    _controller.loadMore();
                  }
                }

                return false;
              },
              child: Scrollbar(
                controller: _scrollController,
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                      sliver: SliverList.builder(
                        itemCount: _controller.logs.length,
                        itemBuilder: (context, index) => LogEntryCard(
                          log: _controller.logs[index],
                        ),
                      ),
                    ),
                    if (_controller.isFetchingMore)
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  const _FilterBar({
    // ignore: unused_element_parameter
    super.key,
    required this.controller,
  });

  final LogViewController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) => ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: [
          FilterSelectionChip<LogLevel>(
            values: controller.usedLevel,
            selectedValues: controller.filterLevels,
            onSelect: (values) {
              controller.filterLevels = values;
            },
            filterSelectionItemLabelBuilder: (value) => switch (value) {
              LogLevel.trace => 'Trace',
              LogLevel.debug => 'Debug',
              LogLevel.info => 'Info',
              LogLevel.warning => 'Warning',
              LogLevel.error => 'Error',
              LogLevel.fatal => 'Fatal',
            },
            filterSelectedValuesLabelBuilder: (values) => switch (values) {
              [] => 'All levels',
              [final value] => value.name,
              [final first, final second, ...] =>
                '${first.name}, ${second.name} ...',
            },
          ),
          const SizedBox(width: 8),
          FilterSelectionChip<String>(
            values: controller.usedTags,
            selectedValues: controller.filterTags,
            onSelect: (values) {
              controller.filterTags = values;
            },
            filterSelectionItemLabelBuilder: (value) => value,
            filterSelectedValuesLabelBuilder: (values) => switch (values) {
              [] => 'All tags',
              [final value] => value,
              [final first, final second, ...] => '$first, $second ...',
            },
          ),
          const SizedBox(width: 8),
          FilterSelectionChip<String>(
            values: controller.usedClassnames,
            selectedValues: controller.filterClassnames,
            onSelect: (values) {
              controller.filterClassnames = values;
            },
            filterSelectionItemLabelBuilder: (value) => value,
            filterSelectedValuesLabelBuilder: (values) => switch (values) {
              [] => 'All classes',
              [final value] => value,
              [final first, final second, ...] => '$first, $second ...',
            },
          ),
          const SizedBox(width: 8),
          TimespanFilterChip(
            startDate: controller.filterStartDate,
            endDate: controller.filterEndDate,
            onSelect: (value) {
              controller.setTimespanFilter(value.$1, value.$2);
            },
          ),
        ],
      ),
    );
  }
}

class _LogStatsBottomsheet extends StatelessWidget {
  final LogViewController controller;

  const _LogStatsBottomsheet({
    // ignore: unused_element_parameter
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LogStatistics>(
      future: controller.getStats(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: [
            ListTile(
              title: const Text('Log count'),
              trailing: Text('${snapshot.data!.logCount}'),
            ),
            const Divider(indent: 8, endIndent: 8),
            ListTile(
              title: const Text('Trace count'),
              trailing: Text('${snapshot.data!.traceCount}'),
            ),
            ListTile(
              title: const Text('Debug count'),
              trailing: Text('${snapshot.data!.debugCount}'),
            ),
            ListTile(
              title: const Text('Info count'),
              trailing: Text('${snapshot.data!.infoCount}'),
            ),
            ListTile(
              title: const Text('Warning count'),
              trailing: Text('${snapshot.data!.warningCount}'),
            ),
            ListTile(
              title: const Text('Error count'),
              trailing: Text('${snapshot.data!.errorCount}'),
            ),
            ListTile(
              title: const Text('Fatal count'),
              trailing: Text('${snapshot.data!.fatalCount}'),
            ),
            const Divider(indent: 8, endIndent: 8),
            ListTile(
              title: const Text('Clear logs'),
              trailing: const Icon(Icons.delete_rounded),
              textColor: Theme.of(context).colorScheme.error,
              iconColor: Theme.of(context).colorScheme.error,
              onTap: () async {
                final result = await showAdaptiveDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog.adaptive(
                    title: const Text('Clear logs'),
                    content:
                        const Text('Are you sure you want to clear all logs?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text('Clear'),
                      ),
                    ],
                  ),
                );

                if (result ?? false) {
                  controller.clearLogs();

                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }
}
