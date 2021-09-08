import mapboxgl from "mapbox-gl";
import "mapbox-gl/dist/mapbox-gl.css";
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder";

const initMapbox = () => {
  const mapElement = document.getElementById("map");
  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    bounds.extend([markers.lng, markers.lat]);
    map.fitBounds(bounds, { padding: 70, maxZoom: 17, duration: 1000 });
  };

  if (mapElement) {
    // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/streets-v10",
    });

    map.addControl(
      new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl,
      })
    );

    const markers = JSON.parse(mapElement.dataset.markers);
    const popup = new mapboxgl.Popup().setHTML(markers.info_window);
    const element = document.createElement("div");
    element.className = "marker";
    element.style.backgroundImage = `url('${markers.image_url}')`;
    element.style.backgroundSize = "contain";
    element.style.width = "40px";
    element.style.height = "40px";
    new mapboxgl.Marker(element)
      .setLngLat([markers.lng, markers.lat])
      .setPopup(popup)
      .addTo(map);

    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
