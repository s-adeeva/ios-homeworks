//
//  PostProfile.swift
//  Navigation
//
//  Created by Александра Адеева on 01.05.2023.
//

import UIKit

struct PostProfile {
    var author: String
    var description: String
    var image: UIImage
    var likes: Int
    var views: Int
    
    static func makeMockPost() -> [PostProfile] {
        var post = [PostProfile]()
        
        post.append(PostProfile(author: "Boba cat", description: "Sleeping with mom", image: UIImage(named: "sleeping")!, likes: 15, views: 15))
        post.append(PostProfile(author: "Boba cat", description: "Enjoy the perfect view of Saint Petersburg and have a lovely day :)", image: UIImage(named: "spb")!, likes: 100, views: 150))
        post.append(PostProfile(author: "Boba cat", description: "Kinda studying today. Small me, big knowledge!!!", image: UIImage(named: "studying")!, likes: 50, views: 60))
        post.append(PostProfile(author: "Boba cat", description: "Arghhhhh", image: UIImage(named: "argh")!, likes: 10, views: 15))
        post.append(PostProfile(author: "Boba cat", description: "Catching the sunshine", image: UIImage(named: "relax")!, likes: 30, views: 40))
        
        return post
    }
}
