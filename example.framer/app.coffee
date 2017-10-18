MapboxLayer = require 'MapboxLayer'

############################################
# Example usage.
# For all features, please check the README.
############################################

MapboxLayer.connect('your_mapbox_api_key')

MapContainer = MapboxLayer.create({
	center: [-122.356568, 47.638699]
}, {
	name: 'MapContainer'
	width: 400
	height: 800
})
