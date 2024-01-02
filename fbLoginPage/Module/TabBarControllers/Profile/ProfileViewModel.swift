//
//  ProfileViewModel.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 02/01/2024.
//

import Foundation
import UIKit

class ProfileViewModel {
    var icons: [UIImage] = [
        UIImage(systemName: "bookmark")!,
        UIImage(systemName: "person.2.square.stack")!,
        UIImage(systemName: "book")!,
        UIImage(systemName: "clock")!,
        UIImage(systemName: "film")!,
        UIImage(systemName: "bag")!,
        UIImage(systemName: "person.3")!,
        UIImage(systemName: "newspaper")!
    ]
    
    var containerTitles = [
        "Saved",
        "Groups",
        "Pages",
        "Memories",
        "Video",
        "Marketplace",
        "Find Friends",
        "Feeds"
    ]
}
