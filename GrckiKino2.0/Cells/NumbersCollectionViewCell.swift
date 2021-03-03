//
//  NumbersCollectionViewCell.swift
//  GrckiKino2.0
//
//  Created by Apple on 1/24/21.
//  Copyright © 2021 milic. All rights reserved.
//

import UIKit

class NumbersCollectionViewCell: UICollectionViewCell {
    @IBOutlet var numbersLabel:UILabel!
    
    func cellConfig(numberArray:[Int],indexPath:IndexPath){
        numbersLabel.text = "\(numberArray[indexPath.row])"
        numbersLabel.textColor = .white
        layer.borderWidth = 1.5
        layer.cornerRadius = 3
        layer.borderColor = UIColor.systemGray.cgColor
    }
}
