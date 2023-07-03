//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Александра Адеева on 09.05.2023.
//

import UIKit

class PhotosViewController: UIViewController {
    
    private let photos = Photos.placePhotos()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotosCollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.frame = CGRect(x: UIScreen.main.bounds.width - 58, y: 110, width: 50, height: 50)
        closeButton.setBackgroundImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.tintColor = .white
        closeButton.isHidden = true
        closeButton.alpha = 0
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        closeButton.isUserInteractionEnabled = true
        return closeButton
    }()
    
    // MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Gallery"
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    @objc func closeButtonTapped() {
        
        guard let visibleCells = collectionView.visibleCells as? [PhotosCollectionViewCell] else {
            return
        }
        
        for cell in visibleCells {
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
                cell.overlayView.isHidden = true
                cell.center = cell.originalCenter
                self.closeButton.isHidden = true
                self.closeButton.alpha = 0
                self.collectionView.isScrollEnabled = true
            })
        }
    }
    
    
    private func layout() {
        view.addSubview(collectionView)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}

// MARK: Data source
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCollectionViewCell", for: indexPath) as! PhotosCollectionViewCell
        cell.setupCVcell(photo: photos[indexPath.item])
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(photoTapped(_:)))
        cell.picture.addGestureRecognizer(tapGesture)
        cell.picture.isUserInteractionEnabled = true
        
        cell.setOriginalCenter()
        
        return cell
    }
    
    
    @objc func photoTapped(_ sender: UITapGestureRecognizer) {
        
        guard let cell = sender.view?.superview?.superview as? PhotosCollectionViewCell else {
            return
        }
        
        let center = CGPoint(x: self.collectionView.frame.size.width / 2, y: self.collectionView.frame.size.height / 2)
        
        UIView.animate(withDuration: 0.3, animations: {
            cell.overlayView.isHidden = false
            self.closeButton.isHidden = false
            self.collectionView.bringSubviewToFront(cell)
            cell.center = center
            cell.transform = CGAffineTransform(scaleX: 3, y: 3)
            self.collectionView.isScrollEnabled = false
        }) { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.closeButton.alpha = 1
            })
        }
    }
}

// MARK: delegate
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var inset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - inset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        inset
    }
}

