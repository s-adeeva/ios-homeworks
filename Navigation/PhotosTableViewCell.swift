//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Александра Адеева on 08.05.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private let photosLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.translatesAutoresizingMaskIntoConstraints = false
        photosLabel.text = "Photos"
        photosLabel.textColor = .black
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return photosLabel
    }()
    
    private let photosImage: UIImageView = {
        let photosImage = UIImageView()
        photosImage.translatesAutoresizingMaskIntoConstraints = false
        photosImage.contentMode = .scaleAspectFit
        photosImage.clipsToBounds = true
        photosImage.layer.cornerRadius = 6
        photosImage.image = UIImage(named: "chelyabinsk")
        return photosImage
    }()
    
    private let photosImage2: UIImageView = {
        let photosImage2 = UIImageView()
        photosImage2.translatesAutoresizingMaskIntoConstraints = false
        photosImage2.contentMode = .scaleAspectFit
        photosImage2.clipsToBounds = true
        photosImage2.layer.cornerRadius = 6
        photosImage2.image = UIImage(named: "eye")
        return photosImage2
    }()
    
    private let photosImage3: UIImageView = {
        let photosImage3 = UIImageView()
        photosImage3.translatesAutoresizingMaskIntoConstraints = false
        photosImage3.contentMode = .scaleAspectFit
        photosImage3.clipsToBounds = true
        photosImage3.layer.cornerRadius = 6
        photosImage3.image = UIImage(named: "meowtivation")
        return photosImage3
    }()
    
    private let photosImage4: UIImageView = {
        let photosImage4 = UIImageView()
        photosImage4.translatesAutoresizingMaskIntoConstraints = false
        photosImage4.contentMode = .scaleAspectFit
        photosImage4.clipsToBounds = true
        photosImage4.layer.cornerRadius = 6
        photosImage4.image = UIImage(named: "newYear")
        return photosImage4
    }()
    
    private let disclosureIndicator: UIImageView = {
        let disclosureIndicator = UIImageView()
        disclosureIndicator.translatesAutoresizingMaskIntoConstraints = false
        disclosureIndicator.contentMode = .scaleAspectFit
        disclosureIndicator.image = UIImage(systemName: "arrow.right")
        disclosureIndicator.clipsToBounds = true
        disclosureIndicator.tintColor = .black
        return disclosureIndicator
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        [photosLabel, disclosureIndicator, photosImage, photosImage2, photosImage3, photosImage4].forEach {contentView.addSubview($0)}
        
        let screenWidth = UIScreen.main.bounds.width
        let inset: CGFloat = 12
        let imageInset: CGFloat = 8
        
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            photosLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            photosLabel.bottomAnchor.constraint(equalTo: photosImage.topAnchor, constant: -inset),
            photosLabel.trailingAnchor.constraint(equalTo: disclosureIndicator.leadingAnchor),
            photosLabel.heightAnchor.constraint(equalToConstant: 24),
            
            
            disclosureIndicator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            disclosureIndicator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            disclosureIndicator.leadingAnchor.constraint(equalTo: photosLabel.trailingAnchor),
            disclosureIndicator.bottomAnchor.constraint(equalTo: photosImage4.topAnchor, constant: -inset),
            disclosureIndicator.heightAnchor.constraint(equalToConstant: 24),
            
            photosImage.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
            photosImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            photosImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            photosImage.trailingAnchor.constraint(equalTo: photosImage2.leadingAnchor, constant: -imageInset),
            photosImage.widthAnchor.constraint(equalToConstant: (screenWidth - 48) / 4),
            photosImage.heightAnchor.constraint(equalToConstant: 120),
            
            
            
            photosImage2.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
            photosImage2.leadingAnchor.constraint(equalTo: photosImage.trailingAnchor, constant: imageInset),
            photosImage2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            photosImage2.trailingAnchor.constraint(equalTo: photosImage3.leadingAnchor, constant: -imageInset),
            photosImage2.widthAnchor.constraint(equalToConstant: (screenWidth - 48) / 4),
            photosImage2.heightAnchor.constraint(equalToConstant: 120),
            
            
            photosImage3.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
            photosImage3.leadingAnchor.constraint(equalTo: photosImage2.trailingAnchor, constant: imageInset),
            photosImage3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            photosImage3.trailingAnchor.constraint(equalTo: photosImage4.leadingAnchor, constant: -imageInset),
            photosImage3.widthAnchor.constraint(equalToConstant: (screenWidth - 48) / 4),
            photosImage3.heightAnchor.constraint(equalToConstant: 120),
            
            
            photosImage4.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: inset),
            photosImage4.leadingAnchor.constraint(equalTo: photosImage3.trailingAnchor, constant: imageInset),
            photosImage4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            photosImage4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            photosImage4.widthAnchor.constraint(equalToConstant: (screenWidth - 48) / 4),
            photosImage4.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
}
