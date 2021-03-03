//
//  Utils.swift
//  GrckiKino2.0
//
//  Created by Apple on 1/27/21.
//  Copyright © 2021 milic. All rights reserved.
//

import Foundation
import UIKit

func calculatingTimer(_ time:Int) -> String {
    let currentTime = Date().timeIntervalSince1970
    let comingFromTheServer = TimeInterval(time/1000)
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    var formatted = formatter.string(from: (comingFromTheServer-currentTime)) ?? ""
    if formatted == "0" {
        formatted = "0"
    }
    return formatted
}

func cellColor(_ IndexArray:[IndexPath],cell:UICollectionViewCell) {
    var indexPath = [IndexPath]()
    
    for i in 0..<IndexArray.count {
        indexPath.append(IndexArray[i])
    }
    
    for i in 0..<indexPath.count {
        if IndexArray.contains(indexPath[i]){
            for i in 0..<IndexArray.count {
                for j in IndexArray[i] {
                    for k in 0...j{
                        var number = 0
                        number += k
                        switch number{
                        case 0...9:
                            cell.layer.borderWidth = 4.0
                            cell.layer.borderColor = UIColor.red.cgColor
                            cell.layer.cornerRadius = cell.frame.width/2
                        case 10...19:
                            cell.layer.borderWidth = 4.0
                            cell.layer.borderColor = UIColor.blue.cgColor
                            cell.layer.cornerRadius = cell.frame.width/2
                        case 20...29:
                            cell.layer.borderWidth = 4.0
                            cell.layer.borderColor = UIColor.green.cgColor
                            cell.layer.cornerRadius = cell.frame.width/2
                        case 30...39:
                            cell.layer.borderWidth = 4.0
                            cell.layer.borderColor = UIColor.systemPink.cgColor
                            cell.layer.cornerRadius = cell.frame.width/2
                        case 40...49:
                            cell.layer.borderWidth = 4.0
                            cell.layer.borderColor = UIColor.yellow.cgColor
                            cell.layer.cornerRadius = cell.frame.width/2
                        case 50...59:
                            cell.layer.borderWidth = 4.0
                            cell.layer.borderColor = UIColor.orange.cgColor
                            cell.layer.cornerRadius = cell.frame.width/2
                        case 60...69:
                            cell.layer.borderWidth = 4.0
                            cell.layer.borderColor = UIColor.systemTeal.cgColor
                            cell.layer.cornerRadius = cell.frame.width/2
                        default:
                            cell.layer.borderWidth = 4.0
                            cell.layer.borderColor = UIColor.systemIndigo.cgColor
                            cell.layer.cornerRadius = cell.frame.width/2
                        }
                    }
                }
            }
        }
    }
}

func cellColor2(cell:UICollectionViewCell,number:Int) {
    switch number {
    case 1...10:
        cell.layer.borderWidth = 4.0
        cell.layer.borderColor = UIColor.red.cgColor
        cell.layer.cornerRadius = cell.frame.width/2
    case 11...20:
        cell.layer.borderWidth = 4.0
        cell.layer.borderColor = UIColor.blue.cgColor
        cell.layer.cornerRadius = cell.frame.width/2
    case 21...30:
        cell.layer.borderWidth = 4.0
        cell.layer.borderColor = UIColor.green.cgColor
        cell.layer.cornerRadius = cell.frame.width/2
    case 31...40:
        cell.layer.borderWidth = 4.0
        cell.layer.borderColor = UIColor.systemPink.cgColor
        cell.layer.cornerRadius = cell.frame.width/2
    case 41...50:
        cell.layer.borderWidth = 4.0
        cell.layer.borderColor = UIColor.yellow.cgColor
        cell.layer.cornerRadius = cell.frame.width/2
    case 51...60:
        cell.layer.borderWidth = 4.0
        cell.layer.borderColor = UIColor.orange.cgColor
        cell.layer.cornerRadius = cell.frame.width/2
    case 61...70:
        cell.layer.borderWidth = 4.0
        cell.layer.borderColor = UIColor.systemTeal.cgColor
        cell.layer.cornerRadius = cell.frame.width/2
    default:
        cell.layer.borderWidth = 4.0
        cell.layer.borderColor = UIColor.systemIndigo.cgColor
        cell.layer.cornerRadius = cell.frame.width/2
    }
}
