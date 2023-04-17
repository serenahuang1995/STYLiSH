import 'package:flutter/material.dart';

extension WidgetModifier on Widget {
  Widget addPadding(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget addPaddingOnly(
      {double top = 0, double left = 0, double bottom = 0, double right = 0}) {
    return Padding(
        padding:
            EdgeInsets.only(top: top, left: left, bottom: bottom, right: right),
        child: this);
  }
}
