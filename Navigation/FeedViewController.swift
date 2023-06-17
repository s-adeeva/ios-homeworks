//
//  FeedViewController.swift
//  Navigation
//
//  Created by Александра Адеева on 17.04.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    var post = Post(title: "Some post")
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.addArrangedSubview(buttonForPost1)
        stackView.addArrangedSubview(buttonForPost2)
        return stackView
    }()
    
    private let buttonForPost1: UIButton = {
        let buttonForPost1 = UIButton()
        buttonForPost1.setTitleColor(.black, for: .normal)
        buttonForPost1.backgroundColor = .white
        buttonForPost1.setTitle("See the post", for: .normal)
        return buttonForPost1
    }()
    
    private let buttonForPost2: UIButton = {
        let buttonForPost2 = UIButton()
        buttonForPost2.setTitleColor(.black, for: .normal)
        buttonForPost2.backgroundColor = .white
        buttonForPost2.setTitle("See the post", for: .normal)
        return buttonForPost2
    }()
    
    private func setupTargets() {
        buttonForPost1.addTarget(self, action: #selector(button1Pressed), for: .touchUpInside)
        buttonForPost2.addTarget(self, action: #selector(button2Pressed), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.addSubview(stackView)
        setUpConstraints()
        setupTargets()
        
        // делаем нав бар белым
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithDefaultBackground()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            navigationController?.navigationBar.barTintColor = .white
        }
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -250),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50)
        ])
    }
    
    @objc func button1Pressed() {
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
    @objc func button2Pressed() {
        let postVC = PostViewController()
        postVC.post = post
        navigationController?.pushViewController(postVC, animated: true)
    }
}
