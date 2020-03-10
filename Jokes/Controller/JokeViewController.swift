//
//  JokeViewController.swift
//  Jokes
//
//  Created by Denis Ivanov on 07.03.2020.
//  Copyright © 2020 Denis Ivanov. All rights reserved.
//

import UIKit

class JokeViewController: UIViewController {
    // MARK: - Private property
    
    private var jokes: [Joke]?
    private var network: Networking?
    private var bottomConstraintLodingView: NSLayoutConstraint!
    
    lazy private var loadingView: LoadingView = {
        let view = LoadingView()
        view.button.addTarget(self, action: #selector(loadJokes), for: .touchUpInside)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableHeaderView = UIView()
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    // MARK: - Override methods
    
    override func loadView() {
        super.loadView()
        addTableViewToSuperView()
        creatLoadView()
        network = Networking()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Jokes"
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dissmisKeyboard)))
        NotificationCenter.default.addObserver(self, selector: #selector(loadingViewRaiseAboveTheKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK: - Actions
    
    @objc func loadJokes() {
        guard let text = loadingView.textField.text else { return }
        network?.parseJokes(count: text) { [weak self] jokes in
            self?.jokes = jokes
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    @objc func dissmisKeyboard() {
        view.endEditing(true)
    }
    
    @objc func loadingViewRaiseAboveTheKeyboard(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
            self.bottomConstraintLodingView?.constant = -keyboardSize.height
            self.view.layoutIfNeeded()
        })
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: {
            self.bottomConstraintLodingView?.constant = -80
            self.view.layoutIfNeeded()
        })
    }
    
    // MARK: - Private methods
    
    private func addTableViewToSuperView() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func creatLoadView() {
        view.addSubview(loadingView)
        loadingView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        loadingView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomConstraintLodingView = loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80)
        bottomConstraintLodingView.isActive = true
    }
}

extension JokeViewController: UITableViewDataSource {
    // MARK: - UTableViewDataSourse
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jokes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let joke = jokes?[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = joke?.joke
        return cell
    }
}
