//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александра Адеева on 17.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let postProfile = PostProfile.makeMockPost()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private enum CellReuseID: String {
        case custom = "CustomTableViewCell_ReuseID"
    }
    
    private enum HeaderFooterReuseID: String {
        case base = "ProfileHeaderView_ReuseID"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        layout()
        tunetableView()
    }
    
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func tunetableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.sectionHeaderHeight = 240
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16) // разделитель ячейки справа прилипал к вью
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0.0
        }
        
        tableView.tableFooterView = UIView()
        
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderFooterReuseID.base.rawValue)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: CellReuseID.custom.rawValue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
}

// DATASOURCE
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postProfile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellReuseID.custom.rawValue, for: indexPath) as! PostTableViewCell
        cell.setupCell(post: postProfile[indexPath.row])
        return cell
    }
}

// DELEGATE
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderFooterReuseID.base.rawValue) as? ProfileHeaderView else {
            fatalError("couldn't dequeueReusableCell")
        }
        let backgroundView = UIView()
        backgroundView.backgroundColor = .systemGray5
        headerView.backgroundView = backgroundView
        return headerView
    }
}

