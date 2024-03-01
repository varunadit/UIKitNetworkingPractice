//
//  ViewController.swift
//  UIKitNetworkingPractice
//
//  Created by Varun Adit on 1/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    let VCVM: ViewControllerVM = ViewControllerVM()
    
    let searchField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Search Query"
        return textField
    }()
    
    let searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupHomeUI()
    }
    
    
    func setupHomeUI() {
        
        self.view.backgroundColor = .white
        
        tableView.register(LabeledTableCell.self, forCellReuseIdentifier: "Cell")

        self.view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.delegate = self
        tableView.dataSource = self
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        VCVM.homeDelegate = self

    }
    

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VCVM.tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = LabeledTableCell(style: .default, reuseIdentifier: "Cell", str: VCVM.tableData[indexPath.row].label)
        return cell
    }
    
    
}

extension ViewController: HomeVCDataSourceDelegate {
    func onTableUpdated() {
        self.tableView.reloadData()
    }
}
