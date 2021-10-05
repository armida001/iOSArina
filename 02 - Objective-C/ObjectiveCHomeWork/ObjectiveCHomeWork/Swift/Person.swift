//
//  Swifty.swift
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 05.10.2021.
//

import Foundation
import UIKit

@objc class Person: NSObject {
    @objc var name: String!
    @objc var comments: String?
    @objc var parameters: PersonParameters!
    
    @objc init(name: String, comments: String? = nil) {
        self.name = name
        self.comments = comments
        self.parameters = PersonParameters()
    }
    
    @objc override init() {
        super.init()
        self.name = ""
        self.parameters = PersonParameters()
    }
    
    @objc public func testBuyClothes(factory: AbstractFabric) {
        let skirt = factory.createSkirt()
        let tshirt = factory.createTShirt()

        print(skirt.name)
        print(tshirt.name)
    }
}
