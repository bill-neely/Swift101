//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Bill Neely on 1/6/17.
//  Copyright © 2017 Food Demo Inc. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMealInitializationSuceeds() {
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        let fiveRatingMeal = Meal.init(name: "Five", photo: nil, rating: 5)
        XCTAssertNotNil(fiveRatingMeal)
    }

    func testMealInitializationFails() {
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        let noNameMeal = Meal.init(name: "", photo: nil, rating: 5)
        XCTAssertNil(noNameMeal)

        let tooHighRatingMeal = Meal.init(name: "Too High Rating", photo: nil, rating: 6)
        XCTAssertNil(tooHighRatingMeal)
    }

    
}
