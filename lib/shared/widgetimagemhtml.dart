// ignore_for_file: camel_case_types

import 'dart:html' as html;
import 'package:agendacultural/shared/widgetembebwebview.dart';
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
      (int _) => html.ImageElement()
        ..style.borderTopLeftRadius = '7px'
        ..style.borderTopRightRadius = '7px'
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.border = 'none'
        ..style.aspectRatio = '1'        
        ..style.objectFit = 'cover'       
        ..src = imageUrl,
    );
    return IgnorePointer(
      ignoring: true,
      child: EmbedWebView(
        src: imageUrl,
      ),
    );

    
  }
}
