//
//  LiveResultsViewController.swift
//  GrckiKino2.0
//
//  Created by Apple on 2/3/21.
//  Copyright © 2021 milic. All rights reserved.
//

import UIKit
import WebKit

class LiveResultsViewController: UIViewController {
    
    @IBOutlet var resultsWebView:WKWebView!
    
      override func viewDidLoad() {
          super.viewDidLoad()
          let url = URL(string: "https://ds.opap.gr/web_kino/kinoIframe.html?link=https://ds.opap.gr/web_kino/kino/html/Internet_PRODUCTION/KinoDraw_201910.html&resolution=1000x828")
          resultsWebView.load(URLRequest(url: url!))
      }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.tabBarController?.tabBar.isHidden = false
    }

}
