//
//  testCollectionViewCell.swift
//  GrckiKino2.0
//
//  Created by Apple on 1/28/21.
//  Copyright © 2021 milic. All rights reserved.
//

import UIKit

class testCollectionViewCell: UICollectionViewCell {
    @IBOutlet var testLabel:UILabel!
    
    func cellConfig(numbersArray:[Int],indexPath:IndexPath){
        testLabel.text = "\(numbersArray[indexPath.row])"
        testLabel.textColor = .white
    }
}
