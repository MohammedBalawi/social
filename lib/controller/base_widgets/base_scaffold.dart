 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/app_config.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';

import '../../config/responsive/screen_util_new.dart';

class BaseScaffold extends StatelessWidget {
  // final String? title;
  final Widget body;
  final Widget appBar;
  // final bool showBackButton;
  // final Widget? bottom;
  // final EdgeInsets? padding;
  final Color? backgroundColor;
  // final void Function()? onTap;

  const BaseScaffold({
    Key? key,
    required this.body,
    // this.title,
    // this.showBackButton = true,
    // this.bottom,
    // this.padding,
    this.backgroundColor,
    required this.appBar,
    // required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark? AppColors.purpleDark:AppColors.purple,
      body: Column(
        children: [
          appBar,
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.r),
                  topRight: Radius.circular(25.r),
                ),
                color:backgroundColor?? AppColors.backgroundLight,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: body,
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
