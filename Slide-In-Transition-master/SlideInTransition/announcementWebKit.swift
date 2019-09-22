//
//  announcementWebKit.swift
//  SlideInTransition
//
//  Created by david kim on 9/22/19.
//  Copyright © 2019 Gary Tokman. All rights reserved.
//

import UIKit
import WebKit

class announcmentWebKit: WKWebView, WKNavigationDelegate {
    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
           super.init(frame: frame, configuration: configuration)
           self.translatesAutoresizingMaskIntoConstraints = false
           let url = URL(string: "https://quizlet.com/latest")
           self.load(URLRequest(url: url!))
           
       }
       
       required init?(coder: NSCoder) {
           fatalError("Error")
       }
    
    
}
