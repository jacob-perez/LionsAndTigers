//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Jacob Perez on 1/26/15.
//  Copyright (c) 2015 Jacob Perez. All rights reserved.
//

import Foundation
import UIKit


struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    
    func chuff() {
        println("My tiger \(self.name), says chuff chuff!")
    }
    
    func chuffANumberOfTimes(numberOfTimes:Int) {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff()
        }
    }
    
}