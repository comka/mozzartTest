//
//  Round.swift
//  GrckiKino2.0
//
//  Created by Apple on 1/24/21.
//  Copyright © 2021 milic. All rights reserved.
//

import Foundation
import UIKit

struct Round {
    
    var drawID:Int
    var drawTime:String
    var drawTimeUNIX:Int
    
    init (dictionary:[String:Any]){
        drawID = dictionary["drawId"] as! Int
        let draw = dictionary["drawTime"] as! Double
        drawTimeUNIX = dictionary["drawTime"] as! Int
        
        let date = Date(timeIntervalSince1970: (draw/1000))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm"
        drawTime = dateFormatter.string(from: date)
    }
}
