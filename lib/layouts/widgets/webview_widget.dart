import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:marrige_app/config/app_colors.dart';
import 'package:marrige_app/config/app_config.dart';
import 'package:marrige_app/libs/lang/lang.dart';

class WebViewWidget extends StatefulWidget {
  const WebViewWidget({super.key});

  @override
  State<WebViewWidget> createState() => _WebViewWidgetState();
}

class _WebViewWidgetState extends State<WebViewWidget> {
  double progress = 0;
  late PullToRefreshController pullToRefreshController;
  InAppWebViewController? webViewController;
  late InAppWebViewSettings settings;

  @override
  void initState() {
    super.initState();
    pullToRefreshController = PullToRefreshController(
      settings: PullToRefreshSettings(
        color: AppColors.lightGradientColor,
      ),
      onRefresh: _onRefresh,
    );
    settings = InAppWebViewSettings(
      javaScriptEnabled: true,
      useHybridComposition: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.surfaceLight,
        foregroundColor: AppColors.deepPurpleBlack,
        title: Text(AppLocalizations.of(context)!.tr('terms_and_conditions')),
      ),
      body: Stack(
        children: [
          InAppWebView(
            onWebViewCreated: _onWebViewCreated,
            pullToRefreshController: pullToRefreshController,
            initialUrlRequest: URLRequest(
              url: WebUri(
                AppConfig.termOfUseUrl,
              ),
            ),
            onProgressChanged: _onProgressChanged,
            initialSettings: settings,
          ),
          progress < 1.0
              ? LinearProgressIndicator(
                  value: progress,
                  color: Colors.white,
                  backgroundColor: AppColors.accentPink,
                )
              : Container(),
        ],
      ),
    );
  }

  void _onProgressChanged(InAppWebViewController controller, int progress) {
    if (progress == 100) {
      pullToRefreshController.endRefreshing();
    }
    setState(() {
      this.progress = progress / 100;
    });
  }

  void _onRefresh() async {
    if (Platform.isAndroid) {
      webViewController?.reload();
    } else if (Platform.isIOS) {
      webViewController?.loadUrl(
          urlRequest: URLRequest(url: await webViewController?.getUrl()));
    }
  }

  void _onWebViewCreated(InAppWebViewController controller) {
    webViewController = controller;
  }
}
