//
//  InfoViewController.swift
//  Navigation
//
//  Created by Александра Адеева on 17.04.2023.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        let alertButton = UIButton()
        alertButton.frame = CGRect(x: 100, y: 350, width: 200, height: 50)
        alertButton.setTitle("Delete the post", for: .normal)
        alertButton.setTitleColor(.black, for: .normal)
        alertButton.backgroundColor = .white
        alertButton.addTarget(self, action: #selector(alertTapped), for: .touchUpInside)
        view.addSubview(alertButton)
    }
    
    @objc func alertTapped() {
        let alert = UIAlertController(title: "Are you sure?", message: "If you delete this post, you won't be able to get it back", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: { _ in
            print("Canceled")
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { _ in
            print("Deleted")
        }))
        
        self.present(alert, animated: false)
    }
    
}
