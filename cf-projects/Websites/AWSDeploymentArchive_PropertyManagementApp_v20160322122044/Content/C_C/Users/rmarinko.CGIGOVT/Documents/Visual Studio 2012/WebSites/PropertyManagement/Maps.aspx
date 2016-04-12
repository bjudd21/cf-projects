<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Maps.aspx.cs" Inherits="Maps" %>

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
      var map
      var geocoder = new GClientGeocoder();

      function load(address) {
          if (GBrowserIsCompatible()) {
              map = new GMap2(document.getElementById("map"));


              map.setCenter(new GLatLng(27.987592, -82.411047), 13);
              map.addControl(new GLargeMapControl());
              map.addControl(new GMapTypeControl());
              map.addControl(new GScaleControl());
              findAddress(address);
          }
      }

      function findAddress(address) {
          geocoder.getLatLng(
        address,
        function(pt) {
            if (!pt) {
                alert(address + "Address Could Not Be Found");
            } else {

            map.setCenter(pt, 10);
            map.addOverlay(new GMarker(pt))

            }
        }
      );
      }

      //]]>
    </script>





  </head>

 <body onload="load(' <%=this.Page.Request.QueryString["address"]%>')" onunload="GUnload()">
  <%=this.Page.Request.QueryString["address"]%>
    <div id="map" style="width: 600px; height: 400px"></div>
  </body>
</html>
