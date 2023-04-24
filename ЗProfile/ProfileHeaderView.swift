//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александра Адеева on 20.04.2023.
//


import UIKit

class ProfileHeaderView: UIView {
    
    // добавляем картинку
     var imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "Boba")
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 3
        return imageView
    }()
    
    // добавляем лейбл Boba cat
    private var labelName: UILabel = {
        var labelName = UILabel()
        let labelWidth: CGFloat = 100 // задаем ширину лейбла для имени
        let screenWidth = UIScreen.main.bounds.width // получаем ширину экрана
        let centerX = (screenWidth - labelWidth) / 2 // вычисляем координату x
        labelName.textColor = .black
        labelName.textAlignment = .center
        labelName.text = "Boba cat"
        labelName.font = UIFont.boldSystemFont(ofSize: 18)
        return labelName
    }()
    
    // Создаем переменную, которая будет хранить ссылку на экземпляр класса ProfileHeaderView, чтобы при обработке таргета кнопки не возникало ошибки
        var target: ProfileHeaderView?
    
    // добавляем кнопку show status
    private var button: UIButton = {
        var button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4.0
        button.layer.shadowOpacity = 0.7
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.addTarget(target, action: #selector(buttonTapped), for: .touchUpInside) //обрабатываем нажатие кнопки
        return button
    }()
    
    // добавляем лейбл для статуса
    private var labelStatus: UILabel = {
        let labelStatus = UILabel()
        labelStatus.textColor = .gray
        labelStatus.textAlignment = .center
        labelStatus.font = UIFont.systemFont(ofSize: 14)
        labelStatus.text = "Waiting for something..."
        return labelStatus
    }()
    
    // настраиваем элементы на экране
    override func layoutSubviews() {
        super.layoutSubviews()
        let labelWidth: CGFloat = 100 // задаем ширину лейбла для имени
        let screenWidth = UIScreen.main.bounds.width // получаем ширину экрана
        let centerX = (screenWidth - labelWidth) / 2 // размещаем посередине
        //картинка
        imageView.frame = CGRect(x: 16, y: 112, width: 130, height: 130)
        imageView.layer.cornerRadius = imageView.frame.width/2
        //имя
        labelName.frame = CGRect(x: centerX, y: 110, width: labelWidth, height: 50)
        //кнопка
        button.frame = CGRect(x: 16, y: imageView.frame.maxY + 16 , width: screenWidth - 32, height: 50)
        //статус
        labelStatus.frame = CGRect(x: centerX, y: button.frame.minY - 84, width: 182, height: 50)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.target = self // у переменной target теперь есть ссылка на экземпляр класса ProfileHeaderView
        configureSubviews()
    }
    
    // добавляем вьюхи на экран
    private func configureSubviews() {
           addSubview(imageView)
           addSubview(labelName)
           addSubview(button)
           addSubview(labelStatus)
       }
    
    // обрабатываем нажатие на кнопку
    @objc func buttonTapped() {
        print(labelStatus.text ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
