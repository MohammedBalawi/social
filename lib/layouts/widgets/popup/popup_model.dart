import 'package:flutter/material.dart';

class PopupModel {
  final bool showImageAsset;
  final String? imageAsset;
  final bool showCloseIcon;
  final String? title;
  final String message;
  final VoidCallback? button1Action;
  final VoidCallback? button2Action;
  final VoidCallback? button3Action;
  final String? button1Text;
  final String? button2Text;
  final String? button3Text;

  const PopupModel({
    this.showImageAsset = true,
    this.title,
    required this.message,
    this.button1Action,
    this.button2Action,
    this.button3Action,
    this.button1Text,
    this.button2Text,
    this.button3Text,
    this.imageAsset,
    this.showCloseIcon = true,
  });
}
