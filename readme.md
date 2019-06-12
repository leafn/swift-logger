# swift-logger
> simple logger for swift / wip
## example
```swift
logger(.d, "test")
logger(.d, false)

logger_format(.d, format: "%d %d %d", arguments: [1, 2, 3])
```
```
[2019-06-12 17:50:35.505] 💬 debug  | ViewController.swift > viewDidLoad(): 25
test
[2019-06-12 17:50:35.507] 💬 debug  | ViewController.swift > viewDidLoad(): 26
false
[2019-06-12 17:50:35.507] 💬 debug  | ViewController.swift > viewDidLoad(): 27
1 2 3
```
