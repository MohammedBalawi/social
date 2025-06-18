import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/manager_font_size.dart';
import 'package:marrige_app/config/manager_height.dart';

import '../../../config/manager_width.dart';
class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: ManagerHeight.h150,
        padding: EdgeInsets.only(left: ManagerWidth.w2,right: ManagerWidth.w2,bottom: ManagerHeight.h2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
            bottomRight: Radius.circular(5.r),
            bottomLeft: Radius.circular(5.r),
          ),
          gradient: LinearGradient(colors: [
            AppColors.grad1Color,
            AppColors.grad2Color,
          ]),
        ),
        child: Column(
          children: [
            Text("Best Seller",style: TextStyle(
              color: AppColors.white,
              fontFamily: "Afacad",
              fontSize: ManagerFontSize.s14,
              fontWeight: FontWeight.w400
            ),),
            Expanded(
              child: Container(
                // height: ManagerHeight.h120,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5.r),
                      bottomLeft: Radius.circular(5.r),
                    ),
                  color: AppColors.white
                ),
                child:  Padding(
                  padding: EdgeInsets.symmetric(horizontal: ManagerWidth.w3),
                  child: Column(
                    children: [
                      Text("Get",style: TextStyle(
                        color: AppColors.colorGetInSpeialOffer,
                        fontFamily: "Afacad",
                        fontWeight: FontWeight.w400,
                        fontSize: ManagerFontSize.s10,
                      ),
                        overflow: TextOverflow.ellipsis,),
                      Expanded(
                        child: Text("2 Spotlight",style: TextStyle(
                          color: AppColors.black,
                          fontFamily: "Afacad",
                          fontWeight: FontWeight.w400,
                          fontSize: ManagerFontSize.s8,
                        ),
                            overflow: TextOverflow.ellipsis),
                      ),
                      Expanded(
                        child: Text("For",style: TextStyle(
                          color: AppColors.colorGetInSpeialOffer,
                          fontFamily: "Afacad",
                          fontWeight: FontWeight.w400,
                          fontSize: ManagerFontSize.s8,
                        ),
                            overflow: TextOverflow.ellipsis),
                      ),
                      Expanded(
                        child: Text("7.51",style: TextStyle(
                          color: AppColors.purple,
                          fontFamily: "Afacad",
                          fontWeight: FontWeight.w400,
                          fontSize: ManagerFontSize.s14,
                        ),
                          maxLines: 1,),
                      ),
                      Expanded(
                        child: Text("Dirham /Every opportunity ",style: TextStyle(
                          color: AppColors.purple,
                          fontFamily: "Afacad",
                          fontWeight: FontWeight.w400,
                          fontSize: ManagerFontSize.s14,
                        ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,),
                      ),
                      Expanded(
                        child: Text("(The price will be 1 For the full offer ) ",style: TextStyle(
                          color: AppColors.colorGetInSpeialOffer,
                          fontFamily: "Afacad",
                          fontWeight: FontWeight.w400,
                          fontSize:ManagerFontSize.s8,
                        ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
