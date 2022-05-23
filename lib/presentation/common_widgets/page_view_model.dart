import 'package:flutter/material.dart';

class PageViewModel {
  final String ? title;
  final Widget ?bage;
  final Widget? bodyWidget;
  final Widget ?image;
  final Widget? footer;


  PageViewModel({
    this.title,
    this.bage,
    this.bodyWidget,
    this.image,
    this.footer,
  })  : assert(bage != null || bodyWidget != null,
        "You must provide either body (String) or bodyWidget (Widget).",
        );
}
