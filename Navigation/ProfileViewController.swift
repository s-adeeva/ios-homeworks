//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александра Адеева on 17.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var postProfile = PostProfile.makeMockPost()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        layout()
        tunetableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        navigationController?.setNavigationBarHidden(true, animated: false)
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
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16) // разделитель ячейки справа прилипал к вью
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0.0
        }
        
        tableView.tableFooterView = UIView()
        
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "ProfileHeaderView")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosTableViewCell")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostTableViewCell")
    }
    //var posts = PostProfile.makeMockPost()
}



// MARK: DATASOURCE
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return postProfile.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosTableViewCell", for: indexPath) as! PhotosTableViewCell
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as! PostTableViewCell
            cell.setupCell(post: postProfile[indexPath.row])
            
            // нажатие на лайки
            let likeTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLikeTap(_:)))
            cell.likesLabel.addGestureRecognizer(likeTapGesture)
            cell.likesLabel.isUserInteractionEnabled = true
            
            // нажатие на картинку
            let imageTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleImageTap(_:)))
            cell.postImage.addGestureRecognizer(imageTapGesture)
            cell.postImage.isUserInteractionEnabled = true
            
            return cell
        default:
            fatalError("Invalid section")
        }
    }
    
    // MARK: Tap Gesture for Likes label
    @objc func handleLikeTap(_ sender: UITapGestureRecognizer) {
        print("tapped")
        guard let cell = sender.view?.superview?.superview as? PostTableViewCell else {
            return
        }
        
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        
        postProfile[indexPath.row].incrementLikes()
        cell.likesLabel.text = "Likes: \(postProfile[indexPath.row].likes)"
        cell.likesLabel.isUserInteractionEnabled = false
    }
    
    // MARK: Tap Gesture for Image in cell
    
    @objc func handleImageTap(_ gesture: UITapGestureRecognizer) {
        guard let view = gesture.view as? UIImageView else {
            return
        }
        guard let cell = view.superview?.superview as? PostTableViewCell else {
            return
        }
        
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        
        print("i'm tapped")
        
        let postImageVC = PostImageViewController()
        
        postProfile[indexPath.row].incrementViews()
        cell.viewsLabel.text = "Views: \(postProfile[indexPath.row].views)"
        print(postProfile[indexPath.row].likes)
        postImageVC.post = postProfile[indexPath.row]
        
        present(postImageVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 && indexPath.row == 0 {
            let vc = PhotosViewController()
            vc.view.backgroundColor = .white
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

// MARK: DELEGATE
extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 240 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "ProfileHeaderView") as? ProfileHeaderView else {
                fatalError("couldn't dequeueReusableCell")
            }
            let backgroundView = UIView()
            backgroundView.backgroundColor = .systemGray5
            headerView.backgroundView = backgroundView
            return headerView
        } else {
            return nil
        }
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            postProfile.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
}

