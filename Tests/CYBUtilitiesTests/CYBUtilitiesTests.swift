import Testing
@testable import CYBUtilities


struct CYBUtilitiesTests {
    
    var testArray = [1,2,3,4,5]
    
    @Test mutating func array_rearrange() async throws {
        try testArray.rearrange(arrangingElements: [1,2,3], at: 5)
        #expect(testArray == [4, 5, 1, 2, 3])
    }
    
    @Test  mutating func array_rearrange_targetRowOverNumberOfElement() async throws {
        #expect(throws: CYBUtilError.targetRowIsOverNumberOfElement) {
            try testArray.rearrange(arrangingElements: [1,2,3], at: 6)
        }
    }
    
    @Test mutating func array_not_contains_arrangingElements() async throws {
        #expect(throws: CYBUtilError.notContainsArrangingElements) {
            try testArray.rearrange(arrangingElements: [1,2,7], at: 4)
        }
    }
}
