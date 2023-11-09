//
//  ViewController.swift
//  KeyBoardProblem
//
//  Created by Blake on 2023/11/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.view.layer.speed = 0.1
        
        self.setupViews()
    }

    private func setupViews() {
        let headerView = UIView()
        headerView.backgroundColor = .red
        headerView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100)
        self.tableView.tableHeaderView = headerView
        
        self.tableView.register(TSStackViewCell.self, forCellReuseIdentifier: String(describing: TSStackViewCell.self))
        self.tableView.register(TSEmptyCell.self, forCellReuseIdentifier: String(describing: TSEmptyCell.self))
        self.tableView.register(TSNormalCell.self, forCellReuseIdentifier: String(describing: TSNormalCell.self))
        self.tableView.register(TSEmptyHeader.self, forHeaderFooterViewReuseIdentifier: String(describing: TSEmptyHeader.self))
        
        self.view.addSubview(self.tableView)
        self.tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        return tableView
    }()
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 1 {
            return tableView.dequeueReusableCell(withIdentifier: String(describing: TSNormalCell.self), for: indexPath)
        } else if indexPath.row == 2 {
            return tableView.dequeueReusableCell(withIdentifier: String(describing: TSStackViewCell.self), for: indexPath)
        }
        return tableView.dequeueReusableCell(withIdentifier: String(describing: TSEmptyCell.self), for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterView(withIdentifier: String(describing: TSEmptyHeader.self))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0.01))
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
}
