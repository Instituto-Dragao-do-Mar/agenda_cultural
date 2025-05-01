// ignore_for_file: camel_case_types

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Conditional import for web
// import 'dart:html' as html if (dart.library.io) 'dart:io';

class widgetImagemHtml extends StatelessWidget {
  final String url;

  const widgetImagemHtml({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Web-specific implementation
      return IgnorePointer(
        ignoring: true,
        child: HtmlElementView(
          viewType: url,
        ),
      );
    } else {
      // Mobile-specific implementation
      final WebViewController controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..loadRequest(Uri.parse(url));

      return WebViewWidget(controller: controller);
    }
  }
}
