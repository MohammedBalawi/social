// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CustomCupertinoMultiSelect extends StatefulWidget {
//   final List<Map<String, dynamic>> options;
//   final List<dynamic>? initialSelectedValues;
//   final String labelText;
//   final Function(List<dynamic>) onValuesSelected;
//
//   CustomCupertinoMultiSelect({
//     required this.options,
//     required this.onValuesSelected,
//     this.initialSelectedValues,
//     this.labelText = 'Select',
//   });
//
//   @override
//   _CustomCupertinoMultiSelectState createState() => _CustomCupertinoMultiSelectState();
// }
//
// class _CustomCupertinoMultiSelectState extends State<CustomCupertinoMultiSelect> {
//   List<dynamic> _selectedValues = [];
//   bool _selectAll = false;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedValues = widget.initialSelectedValues ?? [];
//   }
//
//   void _onSelectAllToggle() {
//     setState(() {
//       _selectAll = !_selectAll;
//       if (_selectAll) {
//         _selectedValues = widget.options.map((option) => option['value']).toList();
//       } else {
//         _selectedValues.clear();
//       }
//     });
//   }
//
//   void _onItemTapped(dynamic value) {
//     setState(() {
//       if (_selectedValues.contains(value)) {
//         _selectedValues.remove(value);
//       } else {
//         _selectedValues.add(value);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoButton(
//       child: Text(widget.labelText),
//       onPressed: () {
//         showCupertinoModalPopup(
//           context: context,
//           builder: (_) => Container(
//             // color: Colors.black.withOpacity(0.3), // Makes the background semi-transparent
//             child: CupertinoActionSheet(
//               title: Text(widget.labelText),
//               message: Column(
//                 children: [
//                   CupertinoButton(
//                     child: Text(
//                       _selectAll ? 'Deselect All' : 'Select All',
//                       style: TextStyle(color: CupertinoColors.activeBlue),
//                     ),
//                     onPressed: _onSelectAllToggle,
//                   ),
//                   Divider(),
//                   ...widget.options.map((option) {
//                     final isSelected = _selectedValues.contains(option['value']);
//                     return CupertinoButton(
//                       padding: EdgeInsets.zero,
//                       onPressed: () => _onItemTapped(option['value']),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(option['text']),
//                           if (isSelected)
//                             Icon(
//                               CupertinoIcons.check_mark,
//                               color: CupertinoColors.activeBlue,
//                             ),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ],
//               ),
//               cancelButton: CupertinoButton(
//                 child: Text('Done'),
//                 onPressed: () {
//                   Navigator.pop(context);
//                   widget.onValuesSelected(_selectedValues);
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
