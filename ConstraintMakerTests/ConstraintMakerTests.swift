//
//  ConstraintMakerTests.swift
//  ConstraintMakerTests
//
//  Created by ashkan ghodrat on 10/28/1399 AP.
//

import XCTest
import UIKit
@testable import ConstraintMaker

class ConstraintMakerTests: XCTestCase {

    var mainView : UIView!
    var insideView : UIView!
    
    override func setUpWithError() throws {
        
        mainView = UIView()
        insideView = UIView()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        
        
        insideView.addAndConstraint(to: mainView)
            .allEdge()
            
    }



}
