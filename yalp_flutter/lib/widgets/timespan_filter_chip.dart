import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

const List<String> _format = [dd, '.', mm, '.', yyyy];

class TimespanFilterChip extends StatelessWidget {
  final DateTime? startDate;
  final DateTime? endDate;

  final ValueChanged<(DateTime?, DateTime?)> onSelect;

  const TimespanFilterChip({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            switch ((startDate, endDate)) {
              (null, null) => 'All time',
              (null, DateTime endDate) =>
                'Before ${formatDate(endDate, _format)}',
              (DateTime startDate, null) =>
                'After ${formatDate(startDate, _format)}',
              (DateTime startDate, DateTime endDate) =>
                '${formatDate(startDate, _format)} - ${formatDate(endDate, _format)}',
            },
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.arrow_drop_down_rounded,
            size: 18,
          ),
        ],
      ),
      labelPadding: const EdgeInsets.only(left: 8),
      selected: true,
      showCheckmark: false,
      onSelected: (value) async {
        final result = await showModalBottomSheet<(DateTime?, DateTime?)>(
          context: context,
          builder: (context) => _TimespanFilterBottomsheet(
            startDate: startDate,
            endDate: endDate,
          ),
        );

        if (result != null) {
          onSelect(result);
        }
      },
    );
  }
}

class _TimespanFilterBottomsheet extends StatefulWidget {
  final DateTime? startDate;
  final DateTime? endDate;

  const _TimespanFilterBottomsheet({
    // ignore: unused_element
    super.key,
    required this.startDate,
    required this.endDate,
  });

  @override
  State<_TimespanFilterBottomsheet> createState() =>
      _TimespanFilterBottomsheetState();
}

class _TimespanFilterBottomsheetState
    extends State<_TimespanFilterBottomsheet> {
  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    super.initState();

    startDate = widget.startDate;
    endDate = widget.endDate;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurfaceVariant
                      .withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4),
                ),
                height: 4,
                width: 32,
              ),
            ),
          ),
          ListTile(
            title: const Text('After'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  switch (startDate) {
                    final date? => formatDate(date, _format),
                    null => '   -   ',
                  },
                ),
                if (startDate != null) ...[
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    onPressed: () => setState(() => startDate = null),
                  ),
                ],
              ],
            ),
            onTap: () => showDatePicker(
              context: context,
              initialDate: startDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
            ).then((value) {
              if (value != null) {
                setState(() => startDate = value);
              }
            }),
          ),
          ListTile(
            title: const Text('Before'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  switch (endDate) {
                    final date? => formatDate(date, _format),
                    null => '   -   ',
                  },
                ),
                if (endDate != null) ...[
                  const SizedBox(width: 8),
                  IconButton(
                    icon: const Icon(Icons.clear_rounded),
                    onPressed: () => setState(() => endDate = null),
                  ),
                ],
              ],
            ),
            onTap: () => showDatePicker(
              context: context,
              initialDate: endDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
            ).then((value) {
              if (value != null) {
                setState(() => endDate = value);
              }
            }),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: () =>
                    Navigator.of(context).pop((startDate, endDate)),
                child: const Text('Apply'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
