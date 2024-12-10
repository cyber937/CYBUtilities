# CYBUtilities
This package allows to add useful swift language features.

## Array Extension
#### rearrange(arrangingElements: [Element], at row: UInt) throws
This Swift Array extension allows you to rearrange multiple elements within an array, moving them to a specified target position while maintaining the order of the moved elements. It is particularly useful for scenarios where you need precise control over the positioning of certain array elements without losing their original sequence.

- **Multi-element Rearrangement:** Select and move multiple elements in one operation.
- **Order Preservation:** Ensures the selected elements retain their original order after being moved.
- **Targeted Placement:** Specify the exact position where the elements should be moved.

### How to use
To use the extension, simply call the rearrangement method on an array instance.

##### Example
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
