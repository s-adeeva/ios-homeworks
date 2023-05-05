//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Александра Адеева on 03.05.2023.
//

import UIKit

// 1) properties 2) inits 3) methods(funcs)

class PostTableViewCell: UITableViewCell {
    
    private let authorLabel: UILabel = {
        let authorLabel = UILabel()
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.textColor = .black
        authorLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorLabel.numberOfLines = 2
        return authorLabel
    }()
    
    private let postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
        return postImage
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.textColor = .systemGray
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    private let viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.textColor = .black
        viewsLabel.font = UIFont.systemFont(ofSize: 16)
        return viewsLabel
    }()
    
    private let likesLabel: UILabel = {
        let likesLabel = UILabel()
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        likesLabel.textColor = .black
        likesLabel.font = UIFont.systemFont(ofSize: 16)
        return likesLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImage.image = nil
        authorLabel.text = nil
        descriptionLabel.text = nil
        viewsLabel.text = nil
        likesLabel.text = nil
    }
    
    func setupCell(post: PostProfile) {
        authorLabel.text = post.author
        postImage.image = post.image
        descriptionLabel.text = post.description
        viewsLabel.text = "Views: \(post.views)"
        likesLabel.text = "Likes: \(post.likes)"
    }
    
    private func layout() {
        [authorLabel, postImage, descriptionLabel, likesLabel, viewsLabel].forEach { contentView.addSubview($0) }
        
        let inset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            
            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            authorLabel.bottomAnchor.constraint(equalTo: postImage.topAnchor, constant: -12),
            authorLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            postImage.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
            postImage.heightAnchor.constraint(equalToConstant: 300),
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -inset),
            
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: inset),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: viewsLabel.topAnchor, constant: -inset),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            viewsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: inset),
            likesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
        ])
    }
}
