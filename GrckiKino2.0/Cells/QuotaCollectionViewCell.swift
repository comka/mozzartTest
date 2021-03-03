//
//  QuotaCollectionViewCell.swift
//  GrckiKino2.0
//
//  Created by Apple on 1/27/21.
//  Copyright © 2021 milic. All rights reserved.
//

import UIKit

class QuotaCollectionViewCell: UICollectionViewCell {
    @IBOutlet var numberLabel:UILabel!
    @IBOutlet var quotaLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func cellConfig(cell:UICollectionViewCell,numberArray:[Int],quotasArray:[String],indexPath:IndexPath){
        numberLabel.text = "\(numberArray[indexPath.row])"
        numberLabel.textColor = .white
        quotaLabel.text = quotasArray[indexPath.row]
        quotaLabel.textColor = .white
        let cellLine = UIView(frame: CGRect(x: 0, y: 25, width: cell.frame.width, height: 1.5 ))
        cellLine.layer.borderWidth = 1.2
        cellLine.layer.borderColor = UIColor.lightGray.cgColor
        cell.addSubview(cellLine)
    }
}
