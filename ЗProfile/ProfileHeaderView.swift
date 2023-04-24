//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александра Адеева on 20.04.2023.
//


import UIKit

class ProfileHeaderView: UIView {
    
    // добавляем картинку
     var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView()
         avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleAspectFill
         avatarImageView.clipsToBounds = true
         avatarImageView.image = UIImage(named: "Boba")
         avatarImageView.layer.borderColor = UIColor.white.cgColor
         avatarImageView.layer.borderWidth = 3
        return avatarImageView
    }()
    
    // добавляем лейбл Boba cat
    private var fullNameLabel: UILabel = {
        var fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.textColor = .black
        fullNameLabel.textAlignment = .center
        fullNameLabel.text = "Boba cat"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return fullNameLabel
    }()
    
    // Создаем переменную, которая будет хранить ссылку на экземпляр класса ProfileHeaderView, чтобы при обработке таргета кнопки не возникало ошибки
        var target: ProfileHeaderView?
    
    // добавляем кнопку show status
     var setStatusButton: UIButton = {
        var setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.setTitle("Show status", for: .normal)
        setStatusButton.setTitleColor(.white, for: .normal)
        setStatusButton.backgroundColor = .systemBlue
        setStatusButton.layer.cornerRadius = 4
        setStatusButton.layer.shadowColor = UIColor.black.cgColor
        setStatusButton.layer.shadowRadius = 4.0
        setStatusButton.layer.shadowOpacity = 0.7
        setStatusButton.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        setStatusButton.addTarget(target, action: #selector(buttonTapped), for: .touchUpInside) //обрабатываем нажатие кнопки
        return setStatusButton
    }()
    
    // добавляем лейбл для статуса
    private var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.textColor = .gray
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.text = "Waiting for something..."
        return statusLabel
    }()
    
   private var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.text = ""
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.backgroundColor = .white
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        return statusTextField
    }()

    
    override func layoutSubviews() {
           super.layoutSubviews()
            
           avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
       }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.target = self // у переменной target теперь есть ссылка на экземпляр класса ProfileHeaderView
        self.backgroundColor = .lightGray
        configureSubviews()
        setupConstraints()
    }
    
    // добавляем вьюхи на экран
    private func configureSubviews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(setStatusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)
    }
    
    private func setupConstraints() {
      
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            avatarImageView.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -32),
            avatarImageView.trailingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor, constant: -16),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            //fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 32),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -60),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -10),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40)
            
            
            
        ])
    }
    
    // обрабатываем нажатие на кнопку
    @objc func buttonTapped() {
        print(statusLabel.text ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
