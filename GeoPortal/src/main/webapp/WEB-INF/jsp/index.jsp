<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <title>Mouse position example</title>
        
        <script src="<c:url value="/js/jquery-1.11.3.min.js" />" > </script>
        
        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />" type="text/css">
        <script src="<c:url value="/js/bootstrap.min.js" />" > </script>
        
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/ol.css" />">
        <script src="<c:url value="/js/ol.js" />" > </script>
        <style>
            .ol-rotate{display: none}
            #mouse-position{position: absolute; bottom: 0px; left: 5px;}

            #map {position: fixed; width: 100%; height: 100%; left: 0px; top: 0px; right: 0px; bottom: 0px;}
            #map .ol-zoom .ol-zoom-out {
              margin-top: 204px;
            }
            #map .ol-zoomslider {
              background-color: transparent;
              top: 2.3em;
            }

            #map .ol-touch .ol-zoom .ol-zoom-out {
              margin-top: 212px;
            }
            #map .ol-touch .ol-zoomslider {
              top: 2.75em;
            }

            #map .ol-zoom-in.ol-has-tooltip:hover [role=tooltip],
            #map .ol-zoom-in.ol-has-tooltip:focus [role=tooltip] {
              top: 3px;
            }

            #map .ol-zoom-out.ol-has-tooltip:hover [role=tooltip],
            #map .ol-zoom-out.ol-has-tooltip:focus [role=tooltip] {
              top: 232px;
            }            
            #type{position: fixed; top: 10px; left: 40px;}
            #geodesic{position: fixed; top: 10px; left: 140px;}
            #label1{position: fixed; top: 0px; left: 134px;}
            
            .tooltip {
              position: relative;
              background: rgba(0, 0, 0, 0.5);
              border-radius: 4px;
              color: white;
              padding: 4px 8px;
              opacity: 0.7;
              white-space: nowrap;
            }
            .tooltip-measure {
              opacity: 1;
              font-weight: bold;
            }
            .tooltip-static {
              background-color: #ffcc33;
              color: black;
              border: 1px solid white;
            }
            .tooltip-measure:before,
            .tooltip-static:before {
              border-top: 6px solid rgba(0, 0, 0, 0.5);
              border-right: 6px solid transparent;
              border-left: 6px solid transparent;
              content: "";
              position: absolute;
              bottom: -6px;
              margin-left: -7px;
              left: 50%;
            }
            .tooltip-static:before {
              border-top-color: #ffcc33;
            }            
            
        </style>
        
    </head>
    <body>
        <div class="container-fluid">

            <div class="row-fluid">
              <div class="span12">
                <div id="map" class="map"></div>
              </div>
            </div>
            <div class="span6" id="mouse-position">&nbsp;</div>

                  <select id="type">
                    <option value="length">Length</option>
                    <option value="area">Area</option>
                    <option value="nodraw">NoDraw</option>
                  </select>
            
            <label id="label1" class="checkbox"><input type="checkbox" id="geodesic"/>Учитывать кривизну земли</label>

        </div>
        <script>
            
            /** Координаты по позиции мыши */
            var mousePositionControl = new ol.control.MousePosition({
                coordinateFormat: ol.coordinate.createStringXY(4),
                projection: 'EPSG:4326',
                className: 'custom-mouse-position',
                target: document.getElementById('mouse-position'),
                undefinedHTML: '&nbsp;'
            });
            /** Фокус карты */
            var center = ol.proj.fromLonLat([41.9702, 45.0448]);
            
            /** Зум в виде слайда, добавление ползунка */
            var zoomslider = new ol.control.ZoomSlider();
            
            /** Добавление карты OSM */
            var OSM = new ol.layer.Tile({source: new ol.source.OSM()})
            
            /** Добавление векторного слоя для рисования */
            var source = new ol.source.Vector();
            var vector = new ol.layer.Vector({
              source: source,
              style: new ol.style.Style({
                fill: new ol.style.Fill({
                  color: 'rgba(255, 255, 255, 0.2)'
                }),
                stroke: new ol.style.Stroke({
                  color: '#ffcc33',
                  width: 2
                }),
                image: new ol.style.Circle({
                  radius: 7,
                  fill: new ol.style.Fill({
                    color: '#ffcc33'
                  })
                })
              })
            });
            
/**
 * Currently drawn feature.
 * @type {ol.Feature}
 */
var sketch;


/**
 * The help tooltip element.
 * @type {Element}
 */
var helpTooltipElement;


/**
 * Overlay to show the help messages.
 * @type {ol.Overlay}
 */
var helpTooltip;


/**
 * The measure tooltip element.
 * @type {Element}
 */
var measureTooltipElement;


/**
 * Overlay to show the measurement.
 * @type {ol.Overlay}
 */
var measureTooltip;


/**
 * Message to show when the user is drawing a polygon.
 * @type {string}
 */
var continuePolygonMsg = 'Нарисуйте полигон для измерения площади';


/**
 * Message to show when the user is drawing a line.
 * @type {string}
 */
var continueLineMsg = 'Нарисуйте линию для измерения длины';


/**
 * Handle pointer move.
 * @param {ol.MapBrowserEvent} evt
 */
var pointerMoveHandler = function(evt) {
  if (evt.dragging) {
    return;
  }
  /** @type {string} */
  var helpMsg = 'Для начала рисования укажите точку';

  if (sketch) {
    var geom = (sketch.getGeometry());
    if (geom instanceof ol.geom.Polygon) {
      helpMsg = continuePolygonMsg;
    } else if (geom instanceof ol.geom.LineString) {
      helpMsg = continueLineMsg;
    }
  }

  helpTooltipElement.innerHTML = helpMsg;
  helpTooltip.setPosition(evt.coordinate);

  $(helpTooltipElement).removeClass('hidden');
};

            
      
            /** Создание карты */
            var map = new ol.Map({
                logo: false,
                controls: ol.control.defaults({
                attributionOptions: ({
                    collapsible: false
                    })
                }).extend([mousePositionControl,zoomslider]),
                layers: [OSM, vector],
                target: 'map',
                view: new ol.View({
                    center: center,
                    zoom: 12
                })
            });
     
    
    
    
    
    
map.on('pointermove', pointerMoveHandler);

$(map.getViewport()).on('mouseout', function() {
  $(helpTooltipElement).addClass('hidden');
});

var typeSelect = document.getElementById('type');
var geodesicCheckbox = document.getElementById('geodesic');

var draw; // global so we can remove it later
function addInteraction() {
  var type = (typeSelect.value == 'area') ? 'Polygon' : 'LineString';
  draw = new ol.interaction.Draw({
    source: source,
    type: /** @type {ol.geom.GeometryType} */ (type),
    style: new ol.style.Style({
      fill: new ol.style.Fill({
        color: 'rgba(255, 255, 255, 0.2)'
      }),
      stroke: new ol.style.Stroke({
        color: 'rgba(0, 0, 0, 0.5)',
        lineDash: [10, 10],
        width: 2
      }),
      image: new ol.style.Circle({
        radius: 5,
        stroke: new ol.style.Stroke({
          color: 'rgba(0, 0, 0, 0.7)'
        }),
        fill: new ol.style.Fill({
          color: 'rgba(255, 255, 255, 0.2)'
        })
      })
    })
  });
  map.addInteraction(draw);

  createMeasureTooltip();
  createHelpTooltip();

  var listener;
  draw.on('drawstart',
      function(evt) {
        // set sketch
        sketch = evt.feature;

        /** @type {ol.Coordinate|undefined} */
        var tooltipCoord = evt.coordinate;

        listener = sketch.getGeometry().on('change', function(evt) {
          var geom = evt.target;
          var output;
          if (geom instanceof ol.geom.Polygon) {
            output = formatArea(/** @type {ol.geom.Polygon} */ (geom));
            tooltipCoord = geom.getInteriorPoint().getCoordinates();
          } else if (geom instanceof ol.geom.LineString) {
            output = formatLength( /** @type {ol.geom.LineString} */ (geom));
            tooltipCoord = geom.getLastCoordinate();
          }
          measureTooltipElement.innerHTML = output;
          measureTooltip.setPosition(tooltipCoord);
        });
      }, this);

  draw.on('drawend',
      function(evt) {
        measureTooltipElement.className = 'tooltip tooltip-static';
        measureTooltip.setOffset([0, -7]);
        // unset sketch
        sketch = null;
        // unset tooltip so that a new one can be created
        measureTooltipElement = null;
        createMeasureTooltip();
        ol.Observable.unByKey(listener);
      }, this);
}


/**
 * Creates a new help tooltip
 */
function createHelpTooltip() {
  if (helpTooltipElement) {
    helpTooltipElement.parentNode.removeChild(helpTooltipElement);
  }
  helpTooltipElement = document.createElement('div');
  helpTooltipElement.className = 'tooltip hidden';
  helpTooltip = new ol.Overlay({
    element: helpTooltipElement,
    offset: [15, 0],
    positioning: 'center-left'
  });
  map.addOverlay(helpTooltip);
}


/**
 * Creates a new measure tooltip
 */
function createMeasureTooltip() {
  if (measureTooltipElement) {
    measureTooltipElement.parentNode.removeChild(measureTooltipElement);
  }
  measureTooltipElement = document.createElement('div');
  measureTooltipElement.className = 'tooltip tooltip-measure';
  measureTooltip = new ol.Overlay({
    element: measureTooltipElement,
    offset: [0, -15],
    positioning: 'bottom-center'
  });
  map.addOverlay(measureTooltip);
}


/**
 * Let user change the geometry type.
 * @param {Event} e Change event.
 */
typeSelect.onchange = function(e) {
  map.removeInteraction(draw);
  addInteraction();
};


/**
 * format length output
 * @param {ol.geom.LineString} line
 * @return {string}
 */
var formatLength = function(line) {
  var length;
  if (geodesicCheckbox.checked) {
    var coordinates = line.getCoordinates();
    length = 0;
    var sourceProj = map.getView().getProjection();
    for (var i = 0, ii = coordinates.length - 1; i < ii; ++i) {
      var c1 = ol.proj.transform(coordinates[i], sourceProj, 'EPSG:4326');
      var c2 = ol.proj.transform(coordinates[i + 1], sourceProj, 'EPSG:4326');
      length += wgs84Sphere.haversineDistance(c1, c2);
    }
  } else {
    length = Math.round(line.getLength() * 100) / 100;
  }
  var output;
  if (length > 100) {
    output = (Math.round(length / 1000 * 100) / 100) +
        ' ' + 'km';
  } else {
    output = (Math.round(length * 100) / 100) +
        ' ' + 'm';
  }
  return output;
};


/**
 * format length output
 * @param {ol.geom.Polygon} polygon
 * @return {string}
 */
var formatArea = function(polygon) {
  var area;
  if (geodesicCheckbox.checked) {
    var sourceProj = map.getView().getProjection();
    var geom = /** @type {ol.geom.Polygon} */(polygon.clone().transform(
        sourceProj, 'EPSG:4326'));
    var coordinates = geom.getLinearRing(0).getCoordinates();
    area = Math.abs(wgs84Sphere.geodesicArea(coordinates));
  } else {
    area = polygon.getArea();
  }
  var output;
  if (area > 10000) {
    output = (Math.round(area / 1000000 * 100) / 100) +
        ' ' + 'km<sup>2</sup>';
  } else {
    output = (Math.round(area * 100) / 100) +
        ' ' + 'm<sup>2</sup>';
  }
  return output;
};

addInteraction();
       
        </script>
    </body>
</html>
