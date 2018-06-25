# 🗺 location

Get your device's physical location and output it as json.

```
OVERVIEW: Output your current location

USAGE: whereami

OPTIONS:
  --address, -a
              Lookup reverse geocoded address
  --follow, -f
              Keep polling for new location updates
  --help      Display available options
```

```
$ whereami
{"course":-1,"v_accuracy":10,"speed":-1,"longitude":37.3320045,"latitude":-122.0329752,"h_accuracy":65,"timestamp":1529408214.771167,"altitude":151.80}
```



## Installation

Make sure Xcode 9+ is installed first.

```
$ brew tap kiliankoe/whereami https://github.com/kiliankoe/whereami.git
$ brew install whereami
```
