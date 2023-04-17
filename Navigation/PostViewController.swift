//
//  PostViewController.swift
//  Navigation
//
//  Created by Александра Адеева on 17.04.2023.
//

import UIKit

class PostViewController: UIViewController {

    var post: Post!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        title = post.title
        
    }
    
// скрываю таб бар на экране поста
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }


}
