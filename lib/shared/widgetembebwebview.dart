import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EmbedWebView extends StatefulWidget {
  final String? src;
  final double? height, width;

  const EmbedWebView({super.key, this.src, this.height, this.width});

  @override
  State<StatefulWidget> createState() {
    return EmbedWebViewState();
  }
}

class EmbedWebViewState extends State<EmbedWebView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.src ?? ''));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: widget.width,
        height: widget.height,
        child: WebViewWidget(controller: _controller),
      ),
    );
  }
}