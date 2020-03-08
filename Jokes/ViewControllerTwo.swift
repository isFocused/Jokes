//
//  ViewControllerTwo.swift
//  Jokes
//
//  Created by Denis Ivanov on 07.03.2020.
//  Copyright © 2020 Denis Ivanov. All rights reserved.
//

//import UIKit
//
//class ViewControllerTwo: UIViewController {
//
//    var myView: MyView!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemGreen
//        myView = MyView()
//        view.addSubview(myView)
//        
//        myView.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        myView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//        myView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        myView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    }
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        view.endEditing(true)
//    }
//}

import WebKit
class ViewControllerTwo: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"http://www.icndb.com/api/")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
}
