import 'dart:convert';
import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';

class MapWidgetToWidget {
  List<Widget> serverWidgets = [];
  mapWidgets(serverUI) {
    for (var element in jsonDecode(serverUI)) {
      String type = element['type'];
      serverWidgets.add(toWidget(element, type));
    }
    return serverWidgets;
  }

  toWidget(element, type) {
    switch (type) {
      case 'FlutterLogo':
        return FlutterLogo(
          size: (element['size']).toDouble(),
        );
      case 'Container':
        return Container(
          width: (element['width']).toDouble(),
          height: (element['height']).toDouble(),
          color: HexColor(element['color']),
          child:
              toWidget(element['attributes'], element['attributes']['types']),
        );
      case "Text":
        return Text(element['txtData']);
      default:
        return (const Text("Error"));
    }
  }
}
