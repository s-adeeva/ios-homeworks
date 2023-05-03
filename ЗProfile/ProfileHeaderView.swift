//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александра Адеева on 20.04.2023.
//


import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
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
    
    private var fullNameLabel: UILabel = {
        var fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.textColor = .black
        fullNameLabel.textAlignment = .center
        fullNameLabel.text = "Boba cat"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return fullNameLabel
    }()
    
    var target: ProfileHeaderView?
    
    var setStatusButton: UIButton = {
        var setStatusButton = UIButton()
        setStatusButton.translatesAutoresizingMaskIntoConstraints = false
        setStatusButton.setTitle("Set status", for: .normal)
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
    
    private var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.textColor = .gray
        statusLabel.textAlignment = .center
        statusLabel.font = UIFont.systemFont(ofSize: 14)
        statusLabel.text = "Waiting for something..."
        return statusLabel
    }()
    
    private var statusText: String = ""
    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.delegate = self
        statusTextField.placeholder = "Your status..."
        statusTextField.indent(size: 5)
        statusTextField.layer.cornerRadius = 12
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1
        statusTextField.backgroundColor = .white
        statusTextField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusTextField.textColor = .black
        statusTextField.addTarget(target, action: #selector(statusTextChanged(_:)), for: .editingDidEnd)
        return statusTextField
    }()
    
    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? ""
        statusLabel.text = statusText
    }
    
    // обрабатываем нажатие на кнопку
    @objc func buttonTapped() {
        statusLabel.text = statusTextField.text
        print(statusLabel.text ?? "")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.target = self
        //backgroundColor = .lightGray
        //tuneView()
        configureSubviews()
        setupConstraints()
    }
    
    //private func tuneView() {
     // contentView.backgroundColor = .systemGray6
     //   translatesAutoresizingMaskIntoConstraints = false
   // }
    
    // добавляем вьюхи на экран
    private func configureSubviews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(setStatusButton)
        addSubview(statusLabel)
        addSubview(statusTextField)
    }
    
    private func setupConstraints() {
        //15 min configure constraints (video UITableViewDelegate)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 130),
            
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -8),
            
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -8),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 28),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// скрываем клавиатуру
extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}

