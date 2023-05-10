//
//  PhotoGallery.swift
//  Navigation
//
//  Created by Александра Адеева on 10.05.2023.
//

import UIKit

struct Photos {
    var image: UIImage
    
    static func placePhotos() -> [Photos] {
        var photo = [Photos]()
        
        photo.append(Photos(image: UIImage(named: "chelyabinsk")!))
        photo.append(Photos(image: UIImage(named: "eye")!))
        photo.append(Photos(image: UIImage(named: "meowtivation")!))
        photo.append(Photos(image: UIImage(named: "newYear")!))
        photo.append(Photos(image: UIImage(named: "party")!))
        photo.append(Photos(image: UIImage(named: "perfect")!))
        photo.append(Photos(image: UIImage(named: "reading")!))
        photo.append(Photos(image: UIImage(named: "spb1")!))
        photo.append(Photos(image: UIImage(named: "spb2")!))
        photo.append(Photos(image: UIImage(named: "spb3")!))
        photo.append(Photos(image: UIImage(named: "spb4")!))
        photo.append(Photos(image: UIImage(named: "spb5")!))
        photo.append(Photos(image: UIImage(named: "spb6")!))
        photo.append(Photos(image: UIImage(named: "spb7")!))
        photo.append(Photos(image: UIImage(named: "taganai")!))
        photo.append(Photos(image: UIImage(named: "them")!))
        photo.append(Photos(image: UIImage(named: "what")!))
        photo.append(Photos(image: UIImage(named: "wait")!))
        photo.append(Photos(image: UIImage(named: "view")!))
        photo.append(Photos(image: UIImage(named: "beauty")!))
        
        return photo
    }
}
