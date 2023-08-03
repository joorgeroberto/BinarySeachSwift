import Foundation

class BinarySearch {
    var count: Int = 0

    func search(array: [Int], value: Int) -> Int? {
        count += 1
        let midElementPosition = array.count / 2
        let midElement = array[midElementPosition]
        let isMidValue = midElement == value
        
        let isLastValue = array.count == 1 && value != array.first
        if isLastValue {
            print("Elemento não está na lista!")
            return nil
        }
        
        if isMidValue {
            print("O elemento foi encontrado em \(count) iterações!")
            return count
        }
        
        let isMidElementGreater = midElement > value
        if isMidElementGreater {
            let midHalf = Array(array[..<midElementPosition])
            let calculatedValue = search(array: midHalf, value: value)
            return calculatedValue
        }
        
        // isMidElementSmaller
        let secondHalf = Array(array[midElementPosition...])
        let calculatedValue = search(array: secondHalf, value: value)
        
        return calculatedValue
    }
}

BinarySearch().search(array: [0,1,2,3,4,5,6], value: 3)

import XCTest

class SettingsViewModelTests: XCTestCase {
    func test_should_found_value_in_the_begin_of_array_with_success() {
        let value = BinarySearch().search(array: [0,1,2,3,4,5,6], value: 0)
        XCTAssertEqual(value, 3)
    }

    func test_should_found_value_in_the_middle_of_array_with_success() {
        let value = BinarySearch().search(array: [0,1,2,3,4,5,6], value: 3)
        XCTAssertEqual(value, 1)
    }

    func test_should_found_value_in_the_end_of_array_with_success() {
        let value = BinarySearch().search(array: [0,1,2,3,4,5,6], value: 6)
        XCTAssertEqual(value, 3)
    }

    func test_should_found_value_in_the_first_half_of_array_with_success() {
        let value = BinarySearch().search(array: [0,1,2,3,4,5,6], value: 2)
        XCTAssertEqual(value, 3)
    }

    func test_should_found_value_in_the_second_half_of_array_with_success() {
        let value = BinarySearch().search(array: [0,1,2,3,4,5,6], value: 5)
        XCTAssertEqual(value, 2)
    }

    func test_should_found_value_with_error() {
        let value = BinarySearch().search(array: [0,1,2,3,4,5,6], value: 7)
        XCTAssertEqual(value, nil)
    }
}

SettingsViewModelTests.defaultTestSuite.run()
