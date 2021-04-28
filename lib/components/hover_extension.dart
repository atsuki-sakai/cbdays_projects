import 'package:flutter/material.dart';

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'elevate_on_hover.dart';

extension HoverExtension on Widget {
  // "app-container" はindex.htmlのbodyタグにidとして付与
  static final appContainer =
      html.window.document.getElementById('app-container');

  Widget get showCursorOnHover {
    return MouseRegion(
      child: this,
      onHover: (_) => appContainer!.style.cursor = 'pointer',
      onExit: (_) => appContainer!.style.cursor = 'pointer',
    );
  }

  Widget get moveUpOnHover {
    return ElevateOnHover(
      child: this,
    );
  }
}
