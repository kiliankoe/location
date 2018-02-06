# 🗺 location

Get your device's physical location and output it as json.

```
OVERVIEW: Output your current location

USAGE: location

OPTIONS:
  --address, -a
              Lookup reverse geocoded address
  --follow, -f
              Keep polling for new location updates
  --help      Display available options
```

```
$ location
{"longitude":37.3320045,"latitude":-122.0329752,"altitude":151,"h_accuracy":65,"v_accuracy":10,"timestamp":1517954509.9017959}
```



## Installation

Make sure Xcode 9+ is installed first.

```
$ brew tap kiliankoe/location https://github.com/kiliankoe/location.git
$ brew install location
```
