//
//  WebViewController.swift
//  Jokes
//
//  Created by Denis Ivanov on 07.03.2020.
//  Copyright © 2020 Denis Ivanov. All rights reserved.
//

import WebKit
class WebViewController: UIViewController {
    
    private var urlRequest: URLRequest! = {
        guard let url = URL(string: "http://www.icndb.com/api/") else { return nil }
        return URLRequest(url: url)
    }()
    
    lazy private var webView: WKWebView = {
        let view = WKWebView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.load(urlRequest)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addConstraintsToWebView()
    }
    
    func addConstraintsToWebView() {
        view.addSubview(webView)
        webView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        webView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        webView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        webView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
