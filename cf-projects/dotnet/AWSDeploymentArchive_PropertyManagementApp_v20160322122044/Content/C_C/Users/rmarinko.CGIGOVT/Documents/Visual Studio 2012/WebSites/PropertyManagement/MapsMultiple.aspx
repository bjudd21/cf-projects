﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MapsMultiple.aspx.cs" Inherits="MapsMultiple" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8"/>
    <title>Find Address</title>
    <%--  <script src=" http://maps.google.com/?file=api&amp;v=2&amp;key=ABQIAAAAjU0EJWnWPMv7oQ-jjS7dYxSPW5CJgpdgO_s4yyMovOaVh_KvvhSfpvagV18eOyDWu7VytS6Bi1CWxw" type="text/javascript"></script> --%>
   <%--<script src=" http://maps.google.com/?file=api&amp;v=2&amp;key=ABQIAAAAZslX3zuoLXko_SxZGtfTLRT2FjKzPI-ZrT2x4018dQyhbaaBFhT95jW3UvdaWdeVZ-1nYbUbqXngKQ" type="text/javascript"></script>--%>
	<script src=" http://maps.google.com/?file=api&amp;v=2&amp;key=ABQIAAAAyJqr-YDhNIvyqQNyymNnZxSq41w-kGHKlVFqTGLPs_ZsGvAktRTg7jCBDl-GoCJW-ybFiGkdXSBlEA" type="text/javascript"></script>
    

     <script type="text/javascript">
         //<![CDATA[
         var highlightCircle;
         var currentMarker;
         var map;

         // Creates a "circle" using 20-sided GPolygon at the given point
         // Circle polygon object is global variable as there is only one highlighted marker at a time
         // and we want to remove the previously placed polygon before placing a new one.

         function highlightCurrentMarker() {
             var markerPoint = currentMarker.getPoint();

             var polyPoints = Array();

             if (highlightCircle) {
                 map.removeOverlay(highlightCircle);
             }

             var mapNormalProj = G_NORMAL_MAP.getProjection();
             var mapZoom = map.getZoom();
             var clickedPixel = mapNormalProj.fromLatLngToPixel(markerPoint, mapZoom);

             var polySmallRadius = 20;

             var polyNumSides = 20;
             var polySideLength = 18;

             for (var a = 0; a < (polyNumSides + 1); a++) {
                 var aRad = polySideLength * a * (Math.PI / 180);
                 var polyRadius = polySmallRadius;
                 var pixelX = clickedPixel.x + polyRadius * Math.cos(aRad);
                 var pixelY = clickedPixel.y + polyRadius * Math.sin(aRad);
                 var polyPixel = new GPoint(pixelX, pixelY);
                 var polyPoint = mapNormalProj.fromPixelToLatLng(polyPixel, mapZoom);
                 polyPoints.push(polyPoint);
             }
             // Using GPolygon(points,  strokeColor?,  strokeWeight?,  strokeOpacity?,  fillColor?,  fillOpacity?)
             highlightCircle = new GPolygon(polyPoints, "#000000", 2, 0.0, "#FF0000", .5);
             map.addOverlay(highlightCircle);
         }


         function load() {
             if (GBrowserIsCompatible()) {
                 map = new GMap2(document.getElementById("map"));
                 map.addControl(new GSmallMapControl());
                 map.addControl(new GMapTypeControl());
                 map.setCenter(new GLatLng(27.987592, -82.411047), 13);
                 GEvent.addListener(map, "zoomend", function() {
                     highlightCurrentMarker();
                 });

                 // Creates a marker at the given point with the given number label
                 function createMarker(point, number) {
                     var marker = new GMarker(point, { draggable: true });

                     // This line highlights the marker when it's clicked
                     GEvent.addListener(marker, "click", function() {
                         currentMarker = marker;
                         highlightCurrentMarker();
                     });

                     // This line highlights the marker when its moused over
                     GEvent.addListener(marker, "mouseover", function() {
                         currentMarker = marker;
                         highlightCurrentMarker();
                     });

                     // This line highlights the marker while dragging
                     GEvent.addListener(marker, "drag", function() {
                         currentMarker = marker;
                         highlightCurrentMarker();
                     });

                     return marker;
                 }

                 // Add 10 markers to the map at random locations
                 var bounds = map.getBounds();
                 var southWest = bounds.getSouthWest();
                 var northEast = bounds.getNorthEast();
                 var lngSpan = northEast.lng() - southWest.lng();
                 var latSpan = northEast.lat() - southWest.lat();
                 for (var i = 0; i < 10; i++) {
                     var point = new GLatLng(southWest.lat() + latSpan * Math.random(),
                                  southWest.lng() + lngSpan * Math.random());
                     map.addOverlay(createMarker(point, i + 1));
                 }
             }
         }

         //]]>
    </script>
  </head>
 
  <body onload="load()" onunload="GUnload()">
    <div id="map" style="width: 500px; height: 500px"></div>
  </body>


</html>
