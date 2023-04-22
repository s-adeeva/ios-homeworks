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
        view.addSubview(profileHeaderV)
    }
    
    override func viewWillLayoutSubviews() { // изменить цвет фона и задайте profileHeaderV frame, равный frame корневого view
        super.viewWillLayoutSubviews()
        view.backgroundColor = .lightGray
        
        profileHeaderV.frame = view.frame
    }
}
