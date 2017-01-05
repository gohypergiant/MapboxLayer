# Mapbox Framer Module

[![license](https://img.shields.io/github/license/bpxl-labs/MapboxLayer.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](.github/CONTRIBUTING.md)
[![Maintenance](https://img.shields.io/maintenance/yes/2017.svg)]()

<img src="https://cloud.githubusercontent.com/assets/935/16820575/7428881a-4917-11e6-9f6b-6938e0b630a1.png" width="497" >

The Mapbox module gives you the ability to create powerful Mapbox maps in your prototypes. You have full control over both the Layer that holds the map and the actual map itself via the Mapbox GL JS API.

### Installation

#### NPM Installation

```
$ cd /your/framer/project
$ npm i framer-mapboxlayer --save
```

#### Manual Installation

First you will need to get the Mapbox GL JS library installed to your project via NPM.

```
$ cd /your/framer/project
$ npm i mapbox-gl
```

Next, copy / save the `MapboxLayer.coffee` file into your project's `modules` folder.

### Adding It To Your Project

In your Framer project add the following:

```javascript
// If you manually installed
MapboxLayer = require 'MapboxLayer'
// Else
MapboxLayer = require 'framer-mapboxlayer'

MapboxLayer.connect('your_mapbox_api_key')

MapContainer = MapboxLayer.create({
	center: [-122.356568, 47.638699]
}, {
	name: 'MapContainer'
	width: 400
	height: 800
})

MapContainer.centerX()
MapContainer.rotationX = 15
```

Each map is generated with a new instance so you can have multiple maps working independently at the same time. You can use `MapContainer.mapbox` to access the instantiated Mapbox map instance.

### API

#### `MapboxLayer.connect(apiKey)`

Connects your Mapbox API key to the Mapbox GL JS library. Also sets up some module specific things like inserting the Mapbox CSS into Framer. This method is required to be called before using the `create` method.

**Arguments**

1. `apiKey` _(String)_: Your Mapbox API key.

#### `MapboxLayer.create(mapOptions, layerOptions)`

Creates a new MapboxLayer.

**Arguments**

1. `mapOptions` _(Object)_: Options to pass directly to Mapbox GL JS ([See here for full options list](https://www.mapbox.com/mapbox-gl-js/api/#Map)).
2. `layerOptions` _(Object)_: Options to pass to a new Framer Layer ([See here for full options list](http://framerjs.com/docs/#layer.layer)).

**Returns**

`Layer` _(Object)_: The newly instantiated Framer Layer. The Mapbox instance is attached to the Layer as the property `mapbox`.

### Tips

**1. Making a non-interactive map**
```javascript
MapContainer = MapboxLayer.create({
	center: [-122.356568, 47.638699]
	interactive: false
}, {
	name: 'MapContainer'
	width: 400
	height: 800
})
```

**2. Show Mapbox Attribution**
```javascript
MapContainer = MapboxLayer.create({
	center: [-122.356568, 47.638699]
	attributionControl: true
}, {
	name: 'MapContainer'
	width: 400
	height: 800
})
```

---

Website: [blackpixel.com](https://blackpixel.com) &nbsp;&middot;&nbsp;
GitHub: [@bpxl-labs](https://github.com/bpxl-labs/) &nbsp;&middot;&nbsp;
Twitter: [@blackpixel](https://twitter.com/blackpixel) &nbsp;&middot;&nbsp;
Medium: [@bpxl-craft](https://medium.com/bpxl-craft)
