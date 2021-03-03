//
//  ViewController.swift
//  GrckiKino2.0
//
//  Created by Apple on 1/24/21.
//  Copyright © 2021 milic. All rights reserved.
//

import UIKit

class TimesViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet var tableView:UITableView!
    var dataSource = [Round]()
    var timer = Timer()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
        DispatchQueue.main.async {
                   DataController.getRounds { (array) in
                       self.dataSource = array!
                       self.tableView.reloadData()
                   }
               }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(tick) , userInfo: nil, repeats: true)
    }
    
    @objc func tick(){
           DataController.getRounds { (array) in
               self.dataSource = array!
               self.tableView.reloadData()
           }
       }
    
    //MARK:-UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TimeTableViewCell
        let oneCell = dataSource[indexPath.row]
        
        cell.configCell(round: oneCell)
        cell.backgroundColor = .black
        cell.layer.borderColor = UIColor.init(red: 22/255, green: 110/255, blue: 178/255, alpha: 1.0).cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
       }
    
    //MARK:-UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height*0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "numbers", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "numbers" {
            let vc = segue.destination as! NumbersViewController
            if let indexpath = tableView.indexPathForSelectedRow{
                let selected = dataSource[indexpath.row]
                let selectedTime = selected
                vc.round = selectedTime
            }
        }
    }
    //MARK:-TableViewHeader
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 70))
        headerView.backgroundColor = UIColor.systemGray

        let gameNameLabel = UILabel()
        gameNameLabel.frame = CGRect.init(x: 70, y: -10, width: headerView.frame.width-10, height: headerView.frame.height-10)
        gameNameLabel.text = "GRCKI KINO (20/80)"
        gameNameLabel.font = UIFont(name: "Futura", size: 17)
        gameNameLabel.textColor = UIColor.white
        
        let greekFlagImage = UIImageView()
        greekFlagImage.image = UIImage(named: "Greek_flag.svg")
        headerView.addSubview(greekFlagImage)
        greekFlagImage.translatesAutoresizingMaskIntoConstraints = false
        greekFlagImage.leadingAnchor.constraint(equalToSystemSpacingAfter: headerView.leadingAnchor, multiplier: 1).isActive = true
        greekFlagImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        greekFlagImage.widthAnchor.constraint(equalToConstant: 50).isActive = true

        let lineView = UIView(frame: CGRect(x: 10, y: 50, width: headerView.frame.width-20, height: 1.0))
        lineView.layer.borderWidth = 1.0
        lineView.layer.borderColor = UIColor.init(red: 17/255, green: 53/255, blue: 124/255, alpha: 1.0).cgColor
        
        let drawTimeLabel = UILabel()
        drawTimeLabel.frame = CGRect.init(x: 10, y: 40, width: headerView.frame.width-10, height: headerView.frame.height-10)
        drawTimeLabel.font = UIFont(name: "Futura", size: 17)
        drawTimeLabel.text = "Vreme izvlacenja"
        drawTimeLabel.textColor = UIColor.white
        
        let timeLeftLabel = UILabel()
        timeLeftLabel.frame = CGRect.init(x: headerView.frame.width-160, y: 40, width: headerView.frame.width-10, height: headerView.frame.height-10)
        timeLeftLabel.text = "Preostalo za uplatu"
        timeLeftLabel.font = UIFont(name: "Futura", size: 17)
        timeLeftLabel.textColor = UIColor.white
        
        headerView.addSubview(timeLeftLabel)
        headerView.addSubview(drawTimeLabel)
        headerView.addSubview(lineView)
        headerView.addSubview(gameNameLabel)

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return tableView.frame.height*0.14
    }
}

