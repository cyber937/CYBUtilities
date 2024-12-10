//
//  CYBUtiltiesTest.swift
//  CYBUtilities
//
//  Created by Kiyoshi Nagahama on 12/10/24.
//

import XCTest
import CYBUtilities

final class CYBUtiltiesTest: XCTestCase {

    var testArray = [1,2,3,4,5]

    func testArrayRearrange() throws {
        try testArray.rearrange(arrangingElements: [1,2,3], at: 5)
        XCTAssertEqual(testArray, [4, 5, 1, 2, 3])
    }

    func testArrayRearrangeTargetRowOverNumberOfElements() throws {
        XCTAssertThrowsError(
            try testArray.rearrange(arrangingElements: [1,2,3], at: 6)
        ) { error in
            XCTAssertEqual(
                error as? CYBUtilError,
                .targetRowIsOverNumberOfElement
            )
        }
    }

    func testArrayNotContainsArrangingElements() throws {
        XCTAssertThrowsError(
            try testArray.rearrange(arrangingElements: [1,2,7], at: 4)
        ) { error in
            XCTAssertEqual(
                error as? CYBUtilError,
                .notContainsArrangingElements
            )
        }
    }
}
