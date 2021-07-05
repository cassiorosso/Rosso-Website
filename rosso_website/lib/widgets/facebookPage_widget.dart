import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

Widget FacebookPage() {
  String htmlId = "7";
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      htmlId,
      (int viewId) => IFrameElement()
        //..width = '500'
        //..height = '400'
        ..src =
            "https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fagricolavetrosso%2F&tabs=timeline&width=500&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId"
        //..style.border = '10px white solid'
        ..style.overflow = 'hidden'
        ..allowFullscreen = true
        ..allow = "autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"
        );

  // var contentString =
  //     """<div class="fb-page" data-href="https://www.facebook.com/agricolavetrosso/"
  //     data-tabs="timeline" data-width="" data-height="" data-small-header="false"
  //     data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
  //     <blockquote cite="https://www.facebook.com/agricolavetrosso/" class="fb-xfbml-parse-ignore">
  //     <a href="https://www.facebook.com/agricolavetrosso/">Agrícola Veterinária Rosso</a>
  //     </blockquote></div>""";
  //     );

  return HtmlElementView(viewType: htmlId);
}
