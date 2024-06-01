import 'package:flutter/cupertino.dart';

import '../../controller/log_viewer_controller.dart';
import 'cupertino_log_entry_card.dart';

class CupertinoLogViewer extends StatefulWidget {
  const CupertinoLogViewer({super.key});

  @override
  State<CupertinoLogViewer> createState() => _CupertinoLogViewerState();
}

class _CupertinoLogViewerState extends State<CupertinoLogViewer> {
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
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Log Viewer'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.refresh),
              onPressed: () => _controller.loadLogs(),
            ),
            // CupertinoButton(
            //   padding: EdgeInsets.zero,
            //   child: const Icon(CupertinoIcons.chart_bar),
            //   onPressed: () => showCupertinoModalPopup(
            //     context: context,
            //   ),
            // ),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            // TODO: Implement filter chips
            const Row(
              children: [],
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, _) {
                  if (_controller.isLoading) {
                    return const Center(
                      child: CupertinoActivityIndicator(),
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
                      child: CupertinoScrollbar(
                        controller: _scrollController,
                        child: CustomScrollView(
                          controller: _scrollController,
                          slivers: [
                            SliverPadding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 8, 16),
                              sliver: SliverList.builder(
                                itemCount: _controller.logs.length,
                                itemBuilder: (context, index) =>
                                    CupertinoLogEntryCard(
                                  log: _controller.logs[index],
                                ),
                              ),
                            ),
                            if (_controller.isFetchingMore)
                              const SliverToBoxAdapter(
                                child: Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                    child: CupertinoActivityIndicator(),
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
            ),
          ],
        ),
      ),
    );
  }
}
