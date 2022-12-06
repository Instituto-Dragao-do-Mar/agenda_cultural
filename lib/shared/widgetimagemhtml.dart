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

// ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      imageUrl,
      (int _) => ImageElement()..src = imageUrl,
    );
    
    return IgnorePointer(
      ignoring: true,
      child: AspectRatio(
        aspectRatio: 1,
        child: HtmlElementView(
          viewType: imageUrl,      
        ),
      ),
    );
  }
}
