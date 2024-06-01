import 'package:flutter/material.dart';

typedef FilterSelectionItemLabelBuilder<T> = String Function(T value);
typedef FilterSelectedValuesLabelBuilder<T> = String Function(List<T> values);

class FilterSelectionChip<T> extends StatelessWidget {
  const FilterSelectionChip({
    super.key,
    required this.selectedValues,
    required this.onSelect,
    required this.values,
    required this.filterSelectionItemLabelBuilder,
    required this.filterSelectedValuesLabelBuilder,
  });

  final List<T> selectedValues;
  final ValueChanged<List<T>> onSelect;
  final List<T> values;
  final FilterSelectionItemLabelBuilder<T> filterSelectionItemLabelBuilder;
  final FilterSelectedValuesLabelBuilder<T> filterSelectedValuesLabelBuilder;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(filterSelectedValuesLabelBuilder(selectedValues)),
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
        final result = await showModalBottomSheet<List<T>>(
          context: context,
          showDragHandle: true,
          builder: (context) => _FilterMenuSelectionBottomsheet<T>(
            values: values,
            selectedValues: selectedValues,
            itemLabelBuilder: filterSelectionItemLabelBuilder,
          ),
        );

        if (result != null) {
          onSelect(result);
        }
      },
    );
  }
}

class _FilterMenuSelectionBottomsheet<T> extends StatefulWidget {
  final List<T> values;
  final List<T> selectedValues;
  final FilterSelectionItemLabelBuilder<T> itemLabelBuilder;

  const _FilterMenuSelectionBottomsheet({
    super.key,
    required this.values,
    required this.selectedValues,
    required this.itemLabelBuilder,
  });

  @override
  State<_FilterMenuSelectionBottomsheet<T>> createState() =>
      _FilterMenuSelectionBottomsheetState<T>();
}

class _FilterMenuSelectionBottomsheetState<T>
    extends State<_FilterMenuSelectionBottomsheet<T>> {
  late final List<T> _selectedValues;

  @override
  void initState() {
    super.initState();

    _selectedValues = widget.selectedValues;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                for (final value in widget.values)
                  CheckboxListTile.adaptive(
                    title: Text(widget.itemLabelBuilder(value)),
                    value: _selectedValues.contains(value),
                    onChanged: (selected) {
                      if (selected == true) {
                        _selectedValues.add(value);
                      } else {
                        _selectedValues.remove(value);
                      }

                      setState(() {});
                    },
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: FilledButton(
                onPressed: () => Navigator.of(context).pop(_selectedValues),
                child: const Text('Apply'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
