class AdditionalContactSettingsModel {
  final bool confirmEmail;
  final bool confirmPhone;
  final bool showEmail;
  final bool facebook;
  final bool twitter;
  final bool instagram;
  final bool skype;
  final bool telegram;
  final bool bb;
  final bool snapchat;

  final bool whatsapp;
  final bool viber;
  final bool tango;
  final bool wechat;

  AdditionalContactSettingsModel({
    required this.confirmEmail,
    required this.confirmPhone,
    required this.showEmail,
    required this.facebook,
    required this.twitter,
    required this.instagram,
    required this.skype,
    required this.telegram,
    required this.bb,
    required this.snapchat,
    required this.whatsapp,
    required this.viber,
    required this.tango,
    required this.wechat,
  });

  factory AdditionalContactSettingsModel.fromJson(Map<String, dynamic> json) {
    final socialApps = json['contact_settings']['social_apps'] ?? {};
    final settings = json['contact_settings'] ?? {};

    return AdditionalContactSettingsModel(
      confirmEmail: settings['confirm_email'] ?? false,
      confirmPhone: settings['confirm_phone'] ?? false,
      showEmail: settings['show_email'] ?? true,
      facebook: settings['facebook'] ?? false,
      twitter: settings['twitter'] ?? false,
      instagram: settings['instagram'] ?? false,
      skype: settings['skype'] ?? false,
      telegram: settings['telegram'] ?? false,
      bb: settings['bb'] ?? false,
      snapchat: settings['snapchat'] ?? false,
      whatsapp: socialApps['whatsapp'] ?? false,
      viber: socialApps['viber'] ?? false,
      tango: socialApps['tango'] ?? false,
      wechat: socialApps['wechat'] ?? false,
    );
  }
}
