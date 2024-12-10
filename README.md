# CYBUtilities
This package allows to add useful swift language features.

## Array Extension
-rearrange(arrangingElements: [Element], at row: UInt) throws

### How to use
```swift

import CYBUtilities

var testArray = [1,2,3,4,5]

do {
  testArray.rearrange(arrangingElements: [2, 4], at: 5)
} catch {
  print(error)
}

// The result
// [1, 3, 5, 2, 4]


```
