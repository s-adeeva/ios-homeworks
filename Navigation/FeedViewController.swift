//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александра Адеева on 17.04.2023.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Some post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        
        // кнопка для перехода к посту
        let buttonForPost = UIButton()
        buttonForPost.frame = CGRect(x: 100, y: 350, width: 200, height: 50)
        buttonForPost.setTitle("See the post", for: .normal)
        buttonForPost.setTitleColor(.black, for: .normal)
        buttonForPost.backgroundColor = .white
        buttonForPost.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view.addSubview(buttonForPost)
    }
    
    @objc func buttonPressed() {
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
}
