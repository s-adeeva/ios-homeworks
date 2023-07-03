//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Александра Адеева on 20.04.2023.
//


import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    lazy var avatarImageView: UIImageView = {
        var avatarImageView = UIImageView()
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.contentMode = .scaleAspectFill
        avatarImageView.clipsToBounds = true
        avatarImageView.image = UIImage(named: "Boba")
        avatarImageView.layer.borderColor = UIColor.white.cgColor
        avatarImageView.layer.borderWidth = 3
        avatarImageView.isUserInteractionEnabled = true
        return avatarImageView
    }()
    
    private var fullNameLabel: UILabel = {
        var fullNameLabel = UILabel()
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.textColor = .black
        fullNameLabel.textAlignment = .center
        fullNameLabel.text = "Boba cat"
        fullNameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        fullNameLabel.numberOfLines = 1
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
        return statusTextField
    }()
    
    private lazy var overlayView: UIView = {
        let overlayView = UIView()
        overlayView.frame = UIScreen.main.bounds
        overlayView.backgroundColor = .black
        overlayView.alpha = 0.5
        overlayView.isHidden = true
        overlayView.isUserInteractionEnabled = false
        return overlayView
    }()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setBackgroundImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.tintColor = .white
        closeButton.isHidden = false
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return closeButton
    }()
    
    private var leadingAnchorAvatar = NSLayoutConstraint()
    private var topAnchorAvatar = NSLayoutConstraint()
    private var heightAnchorAvatar = NSLayoutConstraint()
    private var widthAnchorAvatar = NSLayoutConstraint()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.target = self
        configureSubviews()
        setupConstraints()
        setupGesture()
        bringSubviewToFront(closeButton)
        bringSubviewToFront(avatarImageView)
        isUserInteractionEnabled = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func closeButtonTapped() {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.overlayView.isHidden = true
            self.closeButton.alpha = 0
            
            self.heightAnchorAvatar.constant = 130
            self.widthAnchorAvatar.constant = 130
            self.topAnchorAvatar.constant = 16
            self.layoutIfNeeded()
        })
    }
    
    // обрабатываем нажатие на кнопку
    @objc func buttonTapped() {
        
        guard let newStatus = statusTextField.text, !newStatus.isEmpty else {
            
            if statusTextField.text?.isEmpty == true {
                statusTextField.backgroundColor = UIColor.red.withAlphaComponent(0.3)
                statusTextField.textColor = UIColor.black
            }
            return
        }
        
        statusLabel.text = newStatus
        statusTextField.text = ""
        
        print(statusLabel.text ?? "")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width / 2
    }
    
    func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarImageView.addGestureRecognizer(tapGesture)
    }
    
    @objc private func tapAction() {
        
        UIView.animate(withDuration: 0.5, animations: {
            
            self.overlayView.isHidden = false
            self.heightAnchorAvatar.constant = UIScreen.main.bounds.width - 32
            self.widthAnchorAvatar.constant = UIScreen.main.bounds.width - 32
            self.topAnchorAvatar.constant = UIScreen.main.bounds.width / 2
            self.layoutIfNeeded()
            
        }) { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.closeButton.alpha = 1
            })
        }
    }
    
    // добавляем вьюхи на экран
    private func configureSubviews() {
        [avatarImageView, fullNameLabel, setStatusButton, statusLabel, statusTextField, overlayView, closeButton].forEach {addSubview($0)}
    }
    
    private func setupConstraints() {
        
        widthAnchorAvatar = avatarImageView.widthAnchor.constraint(equalToConstant: 130)
        heightAnchorAvatar = avatarImageView.heightAnchor.constraint(equalToConstant: 130)
        topAnchorAvatar = avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        leadingAnchorAvatar = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        
        
        NSLayoutConstraint.activate([
            widthAnchorAvatar, heightAnchorAvatar, topAnchorAvatar, leadingAnchorAvatar,
            
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            statusLabel.bottomAnchor.constraint(equalTo: statusTextField.topAnchor, constant: -8),
            statusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 160),
            
            statusTextField.bottomAnchor.constraint(equalTo: setStatusButton.topAnchor, constant: -8),
            statusTextField.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - (16 * 3) - 130),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.widthAnchor.constraint(equalToConstant: 50),
            closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: UIScreen.main.bounds.width - 66)
        ])
    }
    
}

// скрываем клавиатуру
extension ProfileHeaderView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == statusTextField {
            statusTextField.backgroundColor = .white
            
        }
    }
}

