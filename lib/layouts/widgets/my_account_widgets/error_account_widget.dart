import 'package:flutter/material.dart';

import '../../../config/app_colors.dart';
import '../../../config/app_config.dart';
import '../../../config/manager_font_size.dart';
import '../../../config/manager_height.dart';
import '../../../config/manager_width.dart';
class ErrorAccountWidget extends StatelessWidget {
  String title;
   ErrorAccountWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "${AppConfig.baseImagePath}/error_in_my_account.png",
          height: ManagerHeight.h24,
          width: ManagerWidth.w24,
        ),
        SizedBox(width: ManagerWidth.w7,),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.colorRedWithOpcity2,
              fontSize: ManagerFontSize.s14,
              fontWeight: FontWeight.w400,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}
