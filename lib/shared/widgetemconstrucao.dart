import 'package:flutter/material.dart';

class widgetEmConstrucao extends StatelessWidget {
  const widgetEmConstrucao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SizedBox(width: double.infinity),
          Text("Página em construção")
        ],
      ),
    );
  }
}
