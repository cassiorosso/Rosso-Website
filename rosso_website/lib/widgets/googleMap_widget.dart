/*//import 'dart:html';
//import 'dart:ui' as ui;
import 'package:flutter/material.dart';
//import 'package:google_maps/google_maps.dart';
import 'package:rosso_website/utils/scree_size.dart';
import 'dart:js' as js;*/

import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';

Widget LocationMap(BuildContext context) {
  final size = ScreenSize();
  return Container(
    height: 500,
    width: size.col_12(context: context),
    child: googleMap(),
  );
}

Widget googleMap() {
  String htmlId = "8";
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      htmlId,
      (int viewId) => IFrameElement()
        ..width = '800'
        ..height = '500'
        ..src =
            "https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3513.6923284634636!2d-52.3806839!3d-28.2773447!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x80f4f861965e0a06!2sAgr%C3%ADcola%20Veterin%C3%A1ria%20Rosso!5e0!3m2!1spt-BR!2sbr!4v1624805706604!5m2!1spt-BR!2sbr"
        //..style.border = '10px white solid'
        ..style.overflow = 'hidden'
        ..allowFullscreen = true
        ..style.border = "0"
        ..allow =
            "autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share");

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
/*class LocationMap extends StatelessWidget {
  final ScreenSize size = ScreenSize();

  @override
  Widget build(BuildContext context) {
    return Container(
        //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        //width: size.col_12(context: context),
        //height: 420,
        child: Stack(
          children: [
            Container(
              width: size.col_12(context: context),
              height: size.isMobile(context: context) ? 540 : 418,
              child: Image.asset(
                size.isMobile(context: context) ?
                "assets/images/location_mobile.png" :
                "assets/images/location.png",
                fit: size.isMobile(context: context) ? BoxFit.none : BoxFit.fitWidth,
                //scale: 0.2,
              ),
            ),
            Positioned(
              top: 15,
              left: 20,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                      side: BorderSide(color: Colors.blueGrey)
                    ),
                    elevation: 2,
                    primary: Colors.grey[300],
                    shadowColor: Colors.black45,
                  ),
              onPressed: () {
                js.context.callMethod('open', ['https://www.google.com/maps/place/Agr%C3%ADcola+Veterin%C3%A1ria+Rosso/@-28.2769101,-52.3831837,17z/data=!3m1!4b1!4m5!3m4!1s0x94e2bfc7253f7e05:0x80f4f861965e0a06!8m2!3d-28.2769101!4d-52.380995?hl=pt-br']);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text("Como chegar", style: TextStyle(color: Colors.grey[800], fontWeight: FontWeight.bold),),
              ),
            ))
          ],
        ));
  }
}*/
// <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3513.692327975283!2d-52.3806838670208!3d-28.27734471479822!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x80f4f861965e0a06!2sAgricultural%20Veterinary%20Rosso!5e0!3m2!1sen!2sbr!4v1624805617124!5m2!1sen!2sbr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
/*
import 'dart:html';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:rosso_website/utils/scree_size.dart';

Widget LocationMap(BuildContext context) {
  final ScreenSize size = ScreenSize();
  String htmlId = "7";
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      htmlId,
      (int viewId) => IFrameElement()
        ..width = '640'
        ..height = '480'
        ..src =
            "https://www.google.com/maps/d/u/0/embed?mid=1UYlgJNH3BaGLHAzkijzvfpjnMV8doYHU"
        //..style.border = '4px white solid'
        //..style.overflow = 'hidden'
        //..allowFullscreen = true
        //..allow = "autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"
        );

  // var contentString =
  //     """<div class="fb-page" data-href="https://www.facebook.com/agricolavetrosso/"
  //     data-tabs="timeline" data-width="" data-height="" data-small-header="false"
  //     data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
  //     <blockquote cite="https://www.facebook.com/agricolavetrosso/" class="fb-xfbml-parse-ignore">
  //     <a href="https://www.facebook.com/agricolavetrosso/">Agrícola Veterinária Rosso</a>
  //     </blockquote></div>""";
  //     );

  return Container(width: size.col_12(context: context), height: 500,child: HtmlElementView(viewType: htmlId));
}


/*
<iframe src="https://www.google.com/maps/d/u/0/embed?mid=1UYlgJNH3BaGLHAzkijzvfpjnMV8doYHU" width="640" height="480"></iframe>
*/
// <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3513.6923284634636!2d-52.3806839!3d-28.2773447!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x80f4f861965e0a06!2sAgr%C3%ADcola%20Veterin%C3%A1ria%20Rosso!5e0!3m2!1spt-BR!2sbr!4v1624805706604!5m2!1spt-BR!2sbr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>


// Widget getMap() {
//   String htmlId = "7";
//   // ignore: undefined_prefixed_name
//   ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
//     final myLatlng = LatLng(-28.27689,-52.381);

//     final mapOptions = MapOptions()
//       ..zoom = 15
//       ..center = LatLng(-28.27689,-52.381);

//     final elem = DivElement()
//       ..id = htmlId
//       ..style.width = "100%"
//       ..style.height = "100%"
//       ..style.border = 'none';

//     final map = GMap(elem, mapOptions);

//     final marker = Marker(MarkerOptions()
//       ..position = myLatlng
//       ..map = map
//       ..label = 'Agrícola Veterinária Rosso'
//       ..title = 'Agrícola Veterinária Rosso');

//       var contentString = '<div id="content">' +
//         '<div id="siteNotice">' +
//         '</div>' +
//         '<h1 id="firstHeading" class="firstHeading">Uluru</h1>' +
//         '<div id="bodyContent">' +
//         '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
//         'sandstone rock formation in the southern part of the ' +
//         'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) ' +
//         'south west of the nearest large town, Alice Springs; 450&#160;km ' +
//         '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major ' +
//         'features of the Uluru - Kata Tjuta National Park. Uluru is ' +
//         'sacred to the Pitjantjatjara and Yankunytjatjara, the ' +
//         'Aboriginal people of the area. It has many springs, waterholes, ' +
//         'rock caves and ancient paintings. Uluru is listed as a World ' +
//         'Heritage Site.</p>' +
//         '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">' +
//         'https://en.wikipedia.org/w/index.php?title=Uluru</a> ' +
//         '(last visited June 22, 2009).</p>' +
//         '</div>' +
//         '</div>';

//     final infoWindow = InfoWindow(InfoWindowOptions()..content = contentString);
//     marker.onClick.listen((event) => infoWindow.open(map, marker));

//     return elem;
//   });

//   return HtmlElementView(viewType: htmlId);
//}*/
