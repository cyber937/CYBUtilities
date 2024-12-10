// The Swift Programming Language
// https://docs.swift.org/swift-book

public enum CYBUtilError: Error {
    case targetRowIsOverNumberOfElement
    case notContainsArrangingElements
}

extension Array where Element: Equatable, Element: Hashable {
    
    public mutating func rearrange(arrangingElements: [Element], at row: UInt) throws {
        
        // For example [0, 1, 2, 3, 4], the element is 5
        //                                                      V
        // Moving elements are [1, 3] at after 2.  -->  [0, 1, 2 ,3, 4]
        // The row to insert is 3
        //
        // After remove the moving item --> [0, 2, 4]
        // How many item is moving before elemtn "2"? --> 1 item ->  this is the offset number.
        // new row is 3 - 1 = 2
        
        
        // Error Checker
        //
        // Check the row is not over the number of element
        guard self.count >= row else { throw CYBUtilError.targetRowIsOverNumberOfElement }
        
        // Check the all elements in 'arrangingElements' exist inside of 'self'
        let selfSet = Set(self)
        let arrangingElementsSet = Set(arrangingElements)
        guard arrangingElementsSet.isSubset(of: selfSet) else { throw CYBUtilError.notContainsArrangingElements }

        
        var arrangingIndexs = [Int]()
        var offset: Int = 0
        
        arrangingElements.forEach { arrangingElement in
            let arrangingIndex = self.firstIndex(of: arrangingElement)!
            arrangingIndexs.append(arrangingIndex)
        }
        
        arrangingIndexs.forEach {
            if $0 < row { offset += 1 }
        }
        
        var deletCont: Int = 0
        
        for (index, item) in self.enumerated() {
            arrangingElements.forEach { arrangingElement in
                if arrangingElement == item {
                    self.remove(at: index - deletCont)
                    deletCont += 1
                }
            }
        }
        
        arrangingElements.indices.forEach { index in
            self.insert(arrangingElements[index], at: index + Int(row) - offset)
        }
        
    }
}
