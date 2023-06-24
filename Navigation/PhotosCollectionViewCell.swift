//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Александра Адеева on 10.05.2023.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    let picture: UIImageView = {
        let picture = UIImageView()
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.clipsToBounds = true
        picture.contentMode = .scaleAspectFill
        return picture
    }()
    
    lazy var overlayView: UIView = {
        let overlayView = UIView()
        overlayView.bounds = UIScreen.main.bounds
        overlayView.backgroundColor = .black
        overlayView.alpha = 0.5
        overlayView.isHidden = true
        overlayView.isUserInteractionEnabled = false
        return overlayView
    }()
    
    lazy var originalCenter: CGPoint = .zero // для возвращения фотографии в исходное положение в коллекции
    
    private var photos = Photos.placePhotos()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setOriginalCenter() {
        originalCenter = center
    }
    
    func setupCVcell(photo: Photos) {
        picture.image = photo.image
    }
    
    private func layout() {
        contentView.addSubview(overlayView)
        contentView.addSubview(picture)
        
        NSLayoutConstraint.activate([
            picture.topAnchor.constraint(equalTo: contentView.topAnchor),
            picture.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            picture.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            picture.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

