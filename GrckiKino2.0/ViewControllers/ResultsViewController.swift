//
//  ResultsViewController.swift
//  GrckiKino2.0
//
//  Created by Apple on 2/3/21.
//  Copyright © 2021 milic. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionView:UICollectionView!
    var dataSource = [Results]()
    var now = ""
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
        DispatchQueue.main.async {
            DataController.getWinningNumbers { (array) in
                self.dataSource = array!
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM"
        now = dateFormatter.string(from: Date())
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: view.bounds.width * 0.09, height: view.bounds.height * 0.09)
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        collectionView.collectionViewLayout = layout
        collectionView.allowsSelection = true
        collectionView.backgroundColor = .black
        
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifer)
    }
 //MARK:-Functions
    func arrayCollections()->[[Int]]{
        var finalArray = [[Int]]()
        for i in dataSource{
            var array = [Int]()
            for j in i.winningNubers["list"] as! [Int]{
                array.append(j)
            }
            finalArray.append(array)
        }
        return finalArray
    }
    //MARK:-UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        for i in dataSource {
            var count = 0
            for _ in i.winningNubers["list"] as! [Int]{
                count += 1
            }
            return count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as! ResultCollectionViewCell
        
        let winningNumbers = arrayCollections()
        
        switch indexPath.section{
        case 0:
            cell.configCell(cell: cell, indexPath: indexPath, numbers: winningNumbers[0])
        case 1:
            cell.configCell(cell: cell, indexPath: indexPath, numbers: winningNumbers[1])
        case 2:
            cell.configCell(cell: cell, indexPath: indexPath, numbers: winningNumbers[2])
        case 3:
            cell.configCell(cell: cell, indexPath: indexPath, numbers: winningNumbers[3])
        case 4:
            cell.configCell(cell: cell, indexPath: indexPath, numbers: winningNumbers[4])
        case 5:
            cell.configCell(cell: cell, indexPath: indexPath, numbers: winningNumbers[5])
        case 6:
            cell.configCell(cell: cell, indexPath: indexPath, numbers: winningNumbers[6])
        case 7:
            cell.configCell(cell: cell, indexPath: indexPath, numbers: winningNumbers[7])
        case 8:
            cell.configCell(cell: cell, indexPath: indexPath, numbers: winningNumbers[8])
        default:
            cell.configCell(cell: cell, indexPath: indexPath, numbers: winningNumbers[9])
        }
        return cell
    }
    //MARK:-UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width*0.09, height: view.bounds.width*0.09)
    }
    //MARK:-UICollectionViewHeader
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifer, for: indexPath) as! HeaderCollectionReusableView
        
        header.configureHeader(data: dataSource, indexPath: indexPath)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.size.width, height: 50)
    }
}
