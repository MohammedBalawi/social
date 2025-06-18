import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:marrige_app/libs/lang/lang.dart';

class CustomCupertinoPicker<T> extends StatelessWidget {
  static String defaultDisplayValue(dynamic v) {
    return '$v';
  }

  const CustomCupertinoPicker({
    super.key,
    required this.items,
    this.initialValue,
    required this.onValueSelected,
    this.itemHeight = 50,
    this.fontSize = 18,
    this.displayItem = CustomCupertinoPicker.defaultDisplayValue,
  });

  final List<T> items;
  final T? initialValue;
  final ValueChanged<T> onValueSelected;
  final double itemHeight;
  final double fontSize;
  final String Function(T? item) displayItem;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor =
        Theme.of(context).brightness == Brightness.light
            ? Colors.white
            : Colors.black;
    final Color textColor = Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;

    final displayItems = initialValue == null ? [null as T] + items : items;
    final initial = initialValue;
    int initialIndex =
        initial != null && items.contains(initial) ? items.indexOf(initial) : 0;

    return Container(
      color: backgroundColor,
      height: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    AppLocalizations.of(context)!.tr('cancel'),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                  onPressed: () {
                    final initial = initialValue;
                    if (initial != null) {
                      onValueSelected(initial);
                    }

                    Navigator.of(context).pop(); // Close the picker
                  },
                ),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Text(
                    AppLocalizations.of(context)!.tr('done'),
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                  onPressed: () {
                    if (initialIndex > 0) {
                      onValueSelected(displayItems[initialIndex]);
                    }
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: CupertinoPicker(
              backgroundColor: backgroundColor,
              itemExtent: itemHeight,
              scrollController:
                  FixedExtentScrollController(initialItem: initialIndex),
              onSelectedItemChanged: (index) {
                if (index > 0 || initialValue != null) {
                  initialIndex = index;
                }
              },
              children: displayItems.map((item) {
                String displayText = item == null
                    ? AppLocalizations.of(context)!.tr('select')
                    : displayItem(item);

                return Center(
                  child: Text(
                    displayText,
                    style: TextStyle(
                      color: item == null ? Colors.grey : textColor,
                      fontSize: fontSize, // Adjusted font size
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
