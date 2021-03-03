//
//  ResultCollectionViewCell.swift
//  GrckiKino2.0
//
//  Created by Apple on 2/4/21.
//  Copyright © 2021 milic. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    @IBOutlet var numberLabel:UILabel!
    
    func configCell(cell:ResultCollectionViewCell,indexPath:IndexPath,numbers:[Int]){
        var array = numbers
        array.sort()
        cell.numberLabel.text = "\(array[indexPath.row])"
        cell.numberLabel.textColor = .white
        cellColor2(cell: cell, number: array[indexPath.row])
    }
}
