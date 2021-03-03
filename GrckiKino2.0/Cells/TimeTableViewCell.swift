//
//  TimeTableViewCell.swift
//  GrckiKino2.0
//
//  Created by Apple on 1/24/21.
//  Copyright © 2021 milic. All rights reserved.
//

import UIKit

class TimeTableViewCell: UITableViewCell {
    @IBOutlet var timeLabel:UILabel!
    @IBOutlet var timerLabel:UILabel!
    
    
    func configCell(round:Round){
        timeLabel.textColor = .white
        timerLabel.textColor = .white
        timeLabel.text = round.drawTime
        let time = calculatingTimer(round.drawTimeUNIX)
        timerLabel.text = time
    }
}
