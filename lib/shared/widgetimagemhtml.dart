// ignore_for_file: camel_case_types

import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class widgetImagemHtml extends StatelessWidget {
  final String url;

  const widgetImagemHtml({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    String imageUrl = url;

    /*final IFrameElement _iframeElement = IFrameElement()
      ..height = '100%'
      ..width = '100%'
      ..src = imageUrl
      ..style.border = 'none'
      ..style.aspectRatio = '`'
      ..style.overflow = "hidden";*/

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int _) => ImageElement()
      
      ..style.width = '100%'  
      ..style.height = '100%'  
      //..style.aspectRatio = '0.5'
      ..src = imageUrl,
    );

    return IgnorePointer(
      ignoring: true,
      child: HtmlElementView(
        viewType: imageUrl,
      ),
    );
  }
}
