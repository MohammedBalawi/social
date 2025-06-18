import 'package:flutter/material.dart';
import 'package:marrige_app/config/app_config.dart';

class AppTextStyles {
  static TextStyle getTextStyle(
    String locale,
    String style, {
    Color? color,
    required BuildContext context, // نحتاج إلى Context للوصول إلى MediaQuery و textScaleFactor
  }) {
    // تحديد الخط بناءً على اللغة
    String fontFamily = locale == 'ar' ? AppConfig.arDefaultFont : 'EnglishFontFamily';

    // تحديد حجم الخط بناءً على اللغة
    double fontSize = 16;  // حجم افتراضي للخط

    // محاولة الحصول على TextScaler من MediaQuery
    TextScaler textScaler;
    try {
      textScaler = MediaQuery.of(context).textScaler;
    } catch (e) {
      // في حالة عدم وجود textScaler نتابع مع القياسات الأخرى
      textScaler = TextScaler.linear(1.0); // استخدام مقياس خطي افتراضي
    }

    // تخصيص النص بناءً على اللغة
    if (locale == 'ar') {
      switch (style) {
        case 'headlineMedium':
          fontSize = 28;
          break;
        case 'headlineSmall':
          fontSize = 24;
          break;
        case 'titleLarge':
          fontSize = 20;
          break;
        case 'labelLarge':
          fontSize = 18;
          break;
        case 'labelMedium':
          fontSize = 16;
          break;
        case 'titleSmall':
          fontSize = 15;
          break;
        case 'titleMedium':
          fontSize = 16;
          break;
        case 'bodySmall':
          fontSize = 12;
          break;
        case 'labelSmall':
          fontSize = 14;
          break;
        case 'displaySmall':
          fontSize = 10;
          break;
        default:
          fontSize = 16;
      }
    } else {
      // English - حجم الخطوط سيكون أصغر بناءً على الخط الافتراضي
      switch (style) {
        case 'headlineMedium':
          fontSize = 28;
          break;
        case 'headlineSmall':
          fontSize = 24;
          break;
        case 'labelLarge':
          fontSize = 20;
          break;
        case 'titleLarge':
          fontSize = 20;
          break;
        case 'labelMedium':
          fontSize = 16;
          break;
        case 'titleSmall':
          fontSize = 15;
          break;
        case 'titleMedium':
          fontSize = 16;
          break;
        case 'bodySmall':
          fontSize = 12;
          break;
        case 'labelSmall':
          fontSize = 14;
          break;
        case 'displaySmall':
          fontSize = 10;
          break;
        default:
          fontSize = 16;
      }
    }

    // إذا كان textScaler موجوداً (تم تكبير النص من إعدادات الوصول)
    if (textScaler.textScaleFactor > 1.0) {
      fontSize = textScaler.scale(fontSize) ;  // تكبير حجم الخط بناءً على قيمة textScaler
    } else {
      // إذا لم يكن textScaler موجودًا أو غير مفعل، نستخدم قياس الشاشة لضبط حجم الخط
      double screenWidth = MediaQuery.of(context).size.width;

      // نزيد حجم الخط بناءً على عرض الشاشة (كلما كانت الشاشة أكبر، يكون حجم الخط أكبر بشكل منطقي)
      if (screenWidth >= 350) {
        fontSize = fontSize * 1.2; // إذا كانت الشاشة كبيرة نزيد حجم الخط بنسبة 20%
      } else if (screenWidth < 350) {
        fontSize = fontSize * 1.1; // إذا كانت الشاشة صغيرة، نقلل حجم الخط بنسبة 10%
      }
    }



    // إرجاع TextStyle مع تحديد الخط وحجم الخط واللون
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      color: color ?? Colors.black, // تعيين اللون الافتراضي إذا لم يتم تحديده
      fontWeight: (style == 'labelSmall' || style == 'displaySmall')
          ? FontWeight.w700
          : FontWeight.normal, // زيادة الوزن لبعض الأنماط
    );
  }
}
