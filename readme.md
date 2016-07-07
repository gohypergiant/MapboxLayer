# Mapbox Framer Module

The Mapbox module gives you the ability to create powerful Mapbox maps in your prototypes. You have full control over both the Layer that holds the map and the actual map itself via the Mapbox GL JS API.

### Getting Started

First you will need to get the Mapbox GL JS library installed to your project via NPM.

```
$ cd /your/framer/project
$ npm i mapbox-gl
```

Next, copy / save the `MapboxLayer.coffee` file into your `modules` folder. In your Framer project add the following:

```javascript
MapboxLayer = require 'MapboxLayer'

MapboxLayer.connect('your_mapbox_api_key')

{ layer, map } = MapboxLayer.create({
	center: [-122.356568, 47.638699]
}, {
	name: 'MyMapContainer'
	width: Screen.width
	height: Screen.height
})
```

Each map is generated with a new instance so you can have multiple maps working independently at the same time. You can also rename your `layer` and `map` objects returned from the `.create` method:

```javascript
{ layer: layerOne, map: mapOne } = MapboxLayer.create({
	center: [-122.356568, 47.638699]
}, {
	name: 'MyMapContainer'
	width: Screen.width
	height: Screen.height
})

layerOne.centerX()
```

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

`{ layer, map }` _(Object)_: The newly instantiated Framer Layer as `layer`, and the newly instantiated Mapbox Map as `map`.

---

Website: [blackpixel.com](https://blackpixel.com) &nbsp;&middot;&nbsp;
GitHub: [@bpxl-labs](https://github.com/bpxl-labs/) &nbsp;&middot;&nbsp;
Twitter: [@blackpixel](https://twitter.com/blackpixel)
