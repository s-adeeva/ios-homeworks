//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александра Адеева on 20.04.2023.
//


import UIKit

class ProfileHeaderView: UIView {
    
    var imageView: UIImageView
    var labelName: UILabel
    var button: UIButton
    var labelStatus: UILabel
    
    
    override init(frame: CGRect) {
        imageView = UIImageView(frame: CGRect(x: 16, y: 112, width: 130, height: 130))
        let labelWidth: CGFloat = 100 // задаем ширину лейбла
        let screenWidth = UIScreen.main.bounds.width // получаем ширину экрана
        let centerX = (screenWidth - labelWidth) / 2 // вычисляем координату x
        labelName = UILabel(frame: CGRect(x: centerX, y: 110, width: labelWidth, height: 50))
        button = UIButton(frame: CGRect(x: 16, y: imageView.frame.maxY + 16 , width: screenWidth - 32, height: 50))
        labelStatus = UILabel(frame: CGRect(x: centerX, y: button.frame.minY - 59, width: 182, height: 50))
        
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(labelName)
        addSubview(button)
        addSubview(labelStatus)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Boba")
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        
        labelName.textColor = .black
        labelName.textAlignment = .center
        labelName.text = "Boba cat"
        labelName.font = UIFont.boldSystemFont(ofSize: 18)
        
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4.0
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        
        labelStatus.textColor = .gray
        labelStatus.textAlignment = .center
        labelStatus.font = UIFont.systemFont(ofSize: 14)
        labelStatus.text = "Waiting for something..."
    }
    
}
