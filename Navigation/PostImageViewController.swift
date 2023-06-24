//
//  PostImageViewController.swift
//  Navigation
//
//  Created by Александра Адеева on 08.06.2023.
//

import UIKit

class PostImageViewController: UIViewController {
    
    var post: PostProfile?
    
    private let authorLabel2: UILabel = {
        let authorLabel2 = UILabel()
        authorLabel2.translatesAutoresizingMaskIntoConstraints = false
        authorLabel2.textColor = .black
        authorLabel2.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLabel2.numberOfLines = 2
        return authorLabel2
    }()
    
    private let postImage2: UIImageView = {
        let postImage2 = UIImageView()
        postImage2.translatesAutoresizingMaskIntoConstraints = false
        postImage2.contentMode = .scaleAspectFit
        postImage2.backgroundColor = .black
        return postImage2
    }()
    
    private let descriptionLabel2: UILabel = {
        let descriptionLabel2 = UILabel()
        descriptionLabel2.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel2.textColor = .systemGray
        descriptionLabel2.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel2.numberOfLines = 0
        return descriptionLabel2
    }()
    
    private let viewsLabel2: UILabel = {
        let viewsLabel2 = UILabel()
        viewsLabel2.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel2.textColor = .black
        viewsLabel2.font = UIFont.systemFont(ofSize: 16)
        return viewsLabel2
    }()
    
    
    private let likesLabel2: UILabel = {
        let likesLabel2 = UILabel()
        likesLabel2.translatesAutoresizingMaskIntoConstraints = false
        likesLabel2.textColor = .black
        likesLabel2.font = UIFont.systemFont(ofSize: 16)
        return likesLabel2
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .systemGray6
        
        if let post = post {
            authorLabel2.text = post.author
            postImage2.image = post.image
            descriptionLabel2.text = post.description
            viewsLabel2.text = "Views: \(post.views)"
            likesLabel2.text = "Likes: \(post.likes)"
        }
    }
    
    private func layout() {
        [authorLabel2, postImage2, descriptionLabel2, viewsLabel2, likesLabel2].forEach { view.addSubview($0) }
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            authorLabel2.topAnchor.constraint(equalTo: view.topAnchor, constant: inset),
            authorLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            
            authorLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            authorLabel2.heightAnchor.constraint(equalToConstant: 20),
            
            postImage2.topAnchor.constraint(equalTo: authorLabel2.bottomAnchor, constant: 12),
            postImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postImage2.heightAnchor.constraint(equalToConstant: 300),
            postImage2.widthAnchor.constraint(equalTo: view.widthAnchor),
            postImage2.bottomAnchor.constraint(equalTo: descriptionLabel2.topAnchor, constant: -inset),
            
            descriptionLabel2.topAnchor.constraint(equalTo: postImage2.bottomAnchor, constant: inset),
            descriptionLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            descriptionLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            descriptionLabel2.bottomAnchor.constraint(equalTo: viewsLabel2.topAnchor, constant: -inset),
            
            
            viewsLabel2.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: inset),
            viewsLabel2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: inset),
            
            likesLabel2.topAnchor.constraint(equalTo: descriptionLabel2.bottomAnchor, constant: inset),
            likesLabel2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -inset),
        ])
    }
}
