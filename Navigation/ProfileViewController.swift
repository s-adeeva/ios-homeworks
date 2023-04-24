//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Александра Адеева on 17.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profileHeaderV: ProfileHeaderView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileHeaderV = ProfileHeaderView()
        profileHeaderV.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileHeaderV)
        configureConstraints()
        profileHeaderV.setStatusButton.setTitle("Set status", for: .normal)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            profileHeaderV.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeaderV.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileHeaderV.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderV.heightAnchor.constraint(equalToConstant: 220),
            profileHeaderV.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
   
}
