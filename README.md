![Kit](http://assets.gingergaming.com/img/kit/logo.png)

Shorten your ComputerCraft lua code by using Kit! This library, or rather API, has all the functions you need to make your code shorter, better-looking and cooler.

# Getting Started
Download and install the latest version of Kit manually at https://github.com/AxTo/Kit/releases/latest, or use the Pastebin installs.
- Pastebin install: `pastebin get 8EmNXzQr install-kit`.
- OpenKit pastebin install: `pastebin get eqdNPkkb install-kit`.

> __Heads Up:__ The current versions of Kit and OpenKit are unstable and thus not 100% working and ready for use yet.

# Documentation

## Load the API
Load the library in your file with a single line of code: 
```
os.loadAPI("kit")
``` 
Use one of the many functions by doing: 
```
kit.functionName()
```
This also applies to OpenKit: 
```
os.loadAPI("openKit")

openKit.functionName()
```

## Kit Functions
Below is a list of all functions in the Kit and OpenKit library.

### isAdvanced()

| cc  1.5 > | Checks if computer is an advanced computer.|
| --------- | ------------------------------------------ |
|Responses: | Boolean (true or false).					 |
|Parameters:| None.										 |
|Example:   | `print( kit.isAdvanced() )`				 |
|Result:    | `true` or `false`							 |

### wrapSides()

|  cc 1.6 >  | Checks all sides for peripherals and wraps them. |
|------------|--------------------------------------------------|
|Responses:  | Number of wrapped peripherals. *returns false if an error occurs.*|
|Parameters: | None. 											|
|Example:    | `result = kit.wrapSides() print(result)`			|
|Result:     | If we've got a printer and a monitor: `2`		|
> __Heads Up:__ The result in numbers, is actually a string, do `tonumber(result)` to convert it to raw numbers again.

### isPresent(peripheral, side)

|  cc 1.5 >  | Checks if a preipheral is present. |
|------------|--------------------------------------------------|
|Responses:  | Boolean (true or false). 					|
|Parameters: | _peripheral_: the wrapped peripheral to search for (required). |
|Example:    | `print( kit.isPresent("monitor", "left") )` |
|Result:     | `true` or `false`							 |

### load(path, isurl)

|  cc 1.5 >  | Load a file or webpage. |
|------------|--------------------------------------------------|
|Responses:  | Fetched data response. *returns false if an error occurs.* |
|Parameters: | _path_: the path to the file including the file name (required). |
|            | _isurl_: Use `true` if _path_ is an URL (optional). |
|Example:    | `result = kit.load("hello.txt") print(result)`|
|Result:	 | Contents of `hello.txt`.									|

### save(data, path, method)

|  cc 1.5 >  | Save data to a file. |
|------------|--------------------------------------------------|
|Responses:  | Boolean (true or false). |
|Parameters: | _data_: the text/code/table you want to save (required). |
|            | _path_: the path to the file including the filename (required).|
|            | _method_: `w` to open it for writing and remove any existing data on file open. Or `a` to open for writing but keep existing data and append any writes to the end of the file.
|Example:    | `result = kit.save("Hello World!", "hello.txt", "a") print(result)` |
|Result:	 | `true` if the operation succeeded, or `false` if something went wrong. |

### explode(seperator, string)

|  cc 1.5 >  | Explode a string by seperator. |
|------------|--------------------------------------------------|
|Responses:  | Table response. *returns false if an error occurs.* |
|Parameters: | _seperator_: explode at the given character (required). |
|            | _string_: data to explode (required). |
|Example:    | `result = kit.explode("#", "one#two#three#four")` |
|Result:	 | Table: `result{ [1]=>"one", [2]=>"two", [3]=>"three", [4]=>"four" }` |

## OpenKit Functions

### getPosition(player, side)

|  openP 0.x >  | Gets current position of given player relative to the sensor. |
|------------|--------------------------------------------------|
|Responses:  | Table response. *returns false if an error occurs.* |
|Parameters: | _player_: the username of the player you want it's current position from (required). |
|            | _side_: the side of the PC where your sensor is located (required). |
|Example:    | `result = openKit.getPosition("alex", "right")` |
|Result:	 | Table: `result{ ["x"]=>"3", ["y"]=>"0", ["z"]=>"2" }` |
> __Heads Up:__ Make sure that the specified player is within the range of the sensor.



*Have any questions/suggestions about the documentation, or do you have a function that __needs__ to be in Kit? Just [open an Issue](https://github.com/AxTo/Kit/issues/new "Open Issue Now"), or [do a Pull Request](https://github.com/AxTo/Kit/compare/ "Do a Pull Request Now").*

----------

# Copyright & License
Code and documentation copyright 2014 AxTo Inc. Code released under [the MIT license](https://github.com/AxTo/Kit/blob/master/LICENSE "The MIT License.").
