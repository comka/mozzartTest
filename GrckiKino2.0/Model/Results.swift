//
//  Results.swift
//  GrckiKino2.0
//
//  Created by Apple on 2/4/21.
//  Copyright © 2021 milic. All rights reserved.
//

import Foundation
import UIKit

struct Results {
    var drawID:Int
    var drawTime:String
    var drawTimeUNIX:Int
    var winningNubers:Dictionary<String,Any>
    
    init (dictionary:[String:Any]){
        drawID = dictionary["drawId"] as! Int
        drawTimeUNIX = dictionary["drawTime"] as! Int
        
        let draw = dictionary["drawTime"] as! Double
        let date = Date(timeIntervalSince1970: draw/1000)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm"
        drawTime = dateFormatter.string(from: date)
        winningNubers = dictionary["winningNumbers"] as! Dictionary<String,Any>
    }
}
