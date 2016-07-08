mapboxgl = require 'mapbox-gl'

# Mapbox client connection status
connected = false

# Mapbox CSS string for insertCSS method
css = '@import "https://api.tiles.mapbox.com/mapbox-gl-js/v0.20.1/mapbox-gl.css"'

layerDefaults =
  name: 'MapboxLayer'

mapDefaults =
  navigation: false
  attributionControl: false
  zoom: 12.5
  style: 'mapbox://styles/mapbox/streets-v9'

# Utility function to generate a valid and unique DOM ID
generateId = () ->
  randLetter = String.fromCharCode(65 + Math.floor(Math.random() * 26))
  id = randLetter + Date.now()
  return id

# Setup accessToken for Mapbox
exports.connect = (token) ->
  Utils.insertCSS(css)
  mapboxgl.accessToken = token
  connected = true

# Factory function to create a new MapLayer
exports.create = (mapOptions={}, layerOptions={}) ->
  if !connected
    throw new Error('MapLayer method ".connect(token)" is required.')

  mapId = generateId()

  layer = new Layer(_.defaults {
    ignoreEvents: false
  }, layerOptions, layerDefaults)

  layer.classList.add(mapId)

  map = new mapboxgl.Map(_.defaults {
    container: document.querySelector('.' + mapId)
  }, mapOptions, mapDefaults)

  if mapOptions.navigation
    map.addControl(new mapboxgl.Navigation())

  layer.mapbox = map;
  return layer
