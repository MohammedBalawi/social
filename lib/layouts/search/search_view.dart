import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';
import 'package:marrige_app/config/manager_width.dart';
import 'package:marrige_app/config/responsive/screen_util_new.dart';
import 'package:marrige_app/controller/base_widgets/button_app.dart';
import 'package:marrige_app/layouts/widgets/search/widget_residancent_fast_search.dart';

import '../../config/app_config.dart';
import '../../controller/base_widgets/base_scaffold.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtilNew.init(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return BaseScaffold(
      appBar: SizedBox(
        height: ManagerHeight.h99,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: ManagerHeight.h35
              ),
              child: Center(
                child: Text(
                  "Fast Search",
                  style: TextStyle(fontSize: ManagerFontSize.s24,
                  color:AppColors.white,
                    fontFamily: "ADLaMDisplay"
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.only(
                    top: ManagerHeight.h47,
                    left: ManagerWidth.w24,
                    right: ManagerWidth.w24
                ),
                child: Image.asset("${AppConfig.baseImagePath}/back_button.png",
                  height: ManagerHeight.h40,
                  width: ManagerWidth.w40,
                  fit: BoxFit.contain,),
              ),
            ),
          ],
        ),
      ),
      backgroundColor:isDarkMode?AppColors.black:AppColors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ManagerHeight.h24),
            WidgetResidancentFastSearch(),
            SizedBox(height: ManagerHeight.h12),
            WidgetResidancentFastSearch(),
            SizedBox(height: ManagerHeight.h12),
            WidgetResidancentFastSearch(),
            SizedBox(height: ManagerHeight.h48),
            GestureDetector(onTap: () {}, child: ButtonApp(title: "Continue", paddingWidth: ManagerWidth.w42,)),
            SizedBox(height: ManagerHeight.h48),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
              child: Text("AdvSearch",style: TextStyle(
                color: AppColors.black,
                fontSize: ManagerFontSize.s24,
                fontWeight: FontWeight.w400,
              ),),
            ),
            SizedBox(height: ManagerHeight.h48),

          ],
        ),
      ),
    );
  }
}
