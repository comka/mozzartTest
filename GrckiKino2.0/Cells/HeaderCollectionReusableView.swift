//
//  HeaderCollectionReusableView.swift
//  GrckiKino2.0
//
//  Created by Apple on 2/4/21.
//  Copyright © 2021 milic. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifer = "HeaderCollectionReusableView"
    
    let label:UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .white
        label.font = UIFont(name: "Futura", size: 17)
        return label
    }()
    
    func configureHeader(data:[Results],indexPath:IndexPath){
        var drawTime = [String]()
        var drawID = [Int]()
        var now = ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM"
        now = dateFormatter.string(from: Date())
        
        for i in data{
            drawTime.append(i.drawTime)
            drawID.append(i.drawID)
        }
        
        label.text = "Vreme izvlacenja:" + now + " " + "\(drawTime[indexPath.section]) " + "|| Kolo:" + "\(drawID[indexPath.section])"
        addSubview(label)
    }
    
    override func layoutSubviews() {
        label.frame = bounds
    }
}
