//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Александра Адеева on 10.05.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private let picture: UIImageView = {
        let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.clipsToBounds = true
        picture.contentMode = .scaleAspectFill
        return picture
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCVcell(photo: Photos) {
        picture.image = photo.image
    }
    
    private func layout() {
        contentView.addSubview(picture)
        
        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: contentView.topAnchor),
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            picture.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            picture.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
