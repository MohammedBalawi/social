import 'package:flutter/material.dart';

class NonDismissingPopupMenuItem<T> extends PopupMenuItem<T> {
  const NonDismissingPopupMenuItem({
    super.key,
    super.value,
    super.onTap,
    super.enabled = true,
    super.height = kMinInteractiveDimension,
    super.padding,
    super.textStyle,
    super.labelTextStyle,
    super.mouseCursor,
    super.child,
  });

  @override
  PopupMenuItemState<T, PopupMenuItem<T>> createState() =>
      _NonDismissingPopupMenuItem<T>();
}

class _NonDismissingPopupMenuItem<T>
    extends PopupMenuItemState<T, PopupMenuItem<T>> {
  @override
  void handleTap() {}

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }


}
