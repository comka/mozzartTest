//
//  NumbersViewController.swift
//  GrckiKino2.0
//
//  Created by Apple on 1/24/21.
//  Copyright © 2021 milic. All rights reserved.
//

import UIKit

class NumbersViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var numbersCollectionView:UICollectionView!
    @IBOutlet var quotaCollectionView:UICollectionView!
    @IBOutlet var testCollectionView:UICollectionView!
    @IBOutlet var infoView:UIView!
    @IBOutlet var timeLabel:UILabel!
    @IBOutlet var roundLabel:UILabel!
    @IBOutlet var numbersSelectedLabel:UILabel!
    @IBOutlet var timeLeftLabel:UILabel!
    @IBOutlet var bottomView:UIView!
    @IBOutlet var quotasView:UIView!
    @IBOutlet weak var myCollectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var myCollectionViewHeight2: NSLayoutConstraint!
    @IBOutlet weak var myCollectionViewHeight3:NSLayoutConstraint!
    
    var timer = Timer()
    var round:Round?
    var temporaryArray = [Int]()
    var selectedCell = [IndexPath]()
    var numberArray = Array(1...80)
    var quotaNumbers = Array(1...8)
    var quotas = ["3.75","14","65","275","1350","6500","25000","125000"]
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = numbersCollectionView.collectionViewLayout.collectionViewContentSize.height
        myCollectionViewHeight.constant = height
        
        let height2 = quotaCollectionView.collectionViewLayout.collectionViewContentSize.height
        myCollectionViewHeight2.constant = height2
        
        let height3 = testCollectionView.collectionViewLayout.collectionViewContentSize.height
        myCollectionViewHeight3.constant = height3
        
        self.view.layoutIfNeeded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.tick) , userInfo: nil, repeats: true)
        setCollectionViewUI()
        setExternalViews()
    }
    
    //MARK:-Functions
    
    @objc func tick(){
        let time = calculatingTimer(round!.drawTimeUNIX)
        timeLeftLabel.text = time
    }
    
    func setCollectionViewUI(){
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        layout.itemSize = CGSize(width: view.bounds.width * 0.09, height: view.bounds.height * 0.09)
        layout.sectionInset = .zero
        numbersCollectionView.collectionViewLayout = layout
        numbersCollectionView.backgroundColor = .black
        numbersCollectionView.allowsSelection = true
        numbersCollectionView.allowsMultipleSelection = true
        
        let layout2 = UICollectionViewFlowLayout()
        layout2.minimumLineSpacing = 0
        layout2.minimumInteritemSpacing = 0
        layout2.itemSize = CGSize(width: view.bounds.width * 0.2, height: view.bounds.height * 0.13)
        layout2.sectionInset = .zero
        layout2.scrollDirection = .horizontal
        quotaCollectionView.collectionViewLayout = layout2
        quotaCollectionView.backgroundColor = .gray
        
        let layout3 = UICollectionViewFlowLayout()
        layout3.minimumLineSpacing = 10
        layout3.minimumInteritemSpacing = 10
        layout3.itemSize = CGSize(width: view.bounds.width * 0.95, height: view.bounds.height * 0.2)
        layout3.sectionInset = .zero
        testCollectionView.collectionViewLayout = layout3
        testCollectionView.backgroundColor = .black
        
        view.backgroundColor = .black
    }
    
    func setExternalViews(){
        let topInfoHline = UIView(frame: CGRect(x: 210, y: 10, width: 3, height: infoView.frame.height-20))
        topInfoHline.layer.borderWidth = 1.2
        topInfoHline.layer.borderColor = UIColor.lightGray.cgColor
        infoView.addSubview(topInfoHline)
        timeLabel.textColor = .white
        roundLabel.textColor = .white
        timeLabel.text = "\(round!.drawTime)"
        roundLabel.text = "\(round!.drawID)"
        
        let bottomInfoHline = UIView(frame: CGRect(x: 75, y: 10, width: 3, height: bottomView.frame.height-20))
        bottomInfoHline.layer.borderWidth = 1.2
        bottomInfoHline.layer.borderColor = UIColor.lightGray.cgColor
        bottomView.addSubview(bottomInfoHline)
        numbersSelectedLabel.layer.borderColor = UIColor.clear.cgColor
        numbersSelectedLabel.layer.borderWidth = 1.2
        numbersSelectedLabel.layer.cornerRadius = numbersSelectedLabel.bounds.size.height / 2
        numbersSelectedLabel.layer.masksToBounds = true
        numbersSelectedLabel.backgroundColor = .systemGray5
        numbersSelectedLabel.text = "0"
        let time = calculatingTimer(round!.drawTimeUNIX)
        timeLeftLabel.text = time
        
        let quotasLine = UIView(frame: CGRect(x: 0, y: bottomInfoHline.frame.origin.y+15.5, width: quotasView.frame.width, height: 1.5))
        quotasLine.layer.borderWidth = 1.2
        quotasLine.layer.borderColor = UIColor.lightGray.cgColor
        quotasView.addSubview(quotasLine)
    }
    
    //MARK:-CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == numbersCollectionView {
            return numberArray.count
        }else if collectionView == quotaCollectionView{
            return 8
        }else{
            return temporaryArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == numbersCollectionView {
            let  cell = numbersCollectionView.dequeueReusableCell(withReuseIdentifier: "numberCell", for: indexPath) as! NumbersCollectionViewCell
            cell.cellConfig(numberArray: numberArray, indexPath: indexPath)
            return cell
        }else if collectionView == quotaCollectionView {
            let  cell = quotaCollectionView.dequeueReusableCell(withReuseIdentifier: "quotaCell", for: indexPath) as! QuotaCollectionViewCell
            cell.cellConfig(cell:cell,numberArray: quotaNumbers, quotasArray: quotas, indexPath: indexPath)
            return cell
        }else {
            let  cell = testCollectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath) as! testCollectionViewCell
            cell.cellConfig(numbersArray: temporaryArray, indexPath: indexPath)
            cellColor2(cell: cell, number: temporaryArray[indexPath.row])
            return cell
        }
    }
    
    //MARK:-CollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == numbersCollectionView {
            let size = CGSize(width: view.bounds.width*0.09, height: view.bounds.width*0.09)
            return size}
        else if collectionView == quotaCollectionView {
            let size = CGSize(width: view.bounds.width*0.2, height: view.bounds.width*0.13)
            return size
        }else {
            let size = CGSize(width: view.bounds.width*0.1, height: view.bounds.width*0.1)
            return size
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if temporaryArray.count <= 14 {
            let cell = collectionView.cellForItem(at: indexPath) as! NumbersCollectionViewCell
            
            selectedCell.append(indexPath)
            cellColor(selectedCell, cell: cell)
            
            let number = Int(cell.numbersLabel.text!)
            temporaryArray.append(number!)
            numbersSelectedLabel.text = "\(temporaryArray.count)"
            testCollectionView.reloadData()
            
            for i in 0...quotas.count-1 {
                if temporaryArray.count-1 >= quotas.count {
                    break
                }else if temporaryArray.count-1 == i{
                    quotaCollectionView.scrollToItem(at: IndexPath(item: i, section: 0), at: .left, animated: true)
                    quotaCollectionView.reloadData()
                }
            }
        }else {
            let alertController = UIAlertController(title: "Obavestenje", message: "Da biste dodali novi broj,morate izbaciti jedan on izabranih", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(okAction)
            self.present(alertController, animated: true)
            numbersSelectedLabel.text = "\(temporaryArray.count)"
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        let cell = numbersCollectionView.cellForItem(at: indexPath) as! NumbersCollectionViewCell
        let number = Int(cell.numbersLabel.text!)
        var preselectArray = [Int]()
        if selectedCell.contains(indexPath) {
            selectedCell.remove(at: selectedCell.firstIndex(of: indexPath)!)
            cell.layer.borderWidth = 1.5
            cell.layer.cornerRadius = 3
            cell.layer.borderColor = UIColor.systemGray.cgColor
        }
        
        for i in 0...quotas.count-1 {
            if temporaryArray.count-1 >= quotas.count {
                break
            }else if temporaryArray.count-1 == i{
                quotaCollectionView.scrollToItem(at: IndexPath(item: i, section: 0), at: .right, animated: true)
                quotaCollectionView.reloadData()
            }
        }
        
        preselectArray = temporaryArray.map{$0}
        temporaryArray.removeAll()
        
        for i in 0...preselectArray.count-1 {
            if preselectArray[i] == number {
                preselectArray.remove(at: i)
                break
            }
        }
        
        if preselectArray.count > 0 {
            temporaryArray = preselectArray.map{$0}
            preselectArray.removeAll()
        }
        
        testCollectionView.reloadData()
        numbersSelectedLabel.text = "\(temporaryArray.count)"
    }
}
