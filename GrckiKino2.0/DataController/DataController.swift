//
//  DataController.swift
//  GrckiKino2.0
//
//  Created by Apple on 1/24/21.
//  Copyright © 2021 milic. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class DataController {
    
    static let BASE_URL = "https://api.opap.gr/draws/v3.0/1100/"
    
    static func getRounds(completion:@escaping ([Round]?) -> Void){
        AF.request(BASE_URL + "upcoming/20", method: .get).response {data in
            if let jsonObject = try! JSONSerialization.jsonObject(with: data.data!, options: .allowFragments) as? [[String:Any]]{
                let rounds = jsonObject.map {Round(dictionary: $0)}
                completion(rounds)
            }
        }
    }
    
    static func getWinningNumbers(completion:@escaping ([Results]?) -> Void){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let now = dateFormatter.string(from: Date())
        
        AF.request("https://api.opap.gr/draws/v3.0/1100/draw-date/\(now)/\(now)").response{data in
            if let jsonObject = try! JSONSerialization.jsonObject(with: data.data!, options: .allowFragments) as? Dictionary<String,Any>{
                if let content = jsonObject["content"] as? Array<Dictionary<String,Any>>{
                    var contentArray = [Results]()
                    for dict in content{
                        let one = Results(dictionary: dict)
                        contentArray.append(one)
                    }
                    completion(contentArray)
                }
            }
        }
    }
}
