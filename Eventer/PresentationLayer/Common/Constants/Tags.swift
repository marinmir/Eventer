//
//  Tags.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 10.08.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

struct Tag {
    var image: UIImage
    var selectedImage: UIImage
    var name: String
}

class Tags {
    static let tags = [ Tag(image: UIImage(named: "Art") ?? UIImage(),
                            selectedImage: UIImage(named: "SelectedArt") ?? UIImage(),
                            name: NSLocalizedString("Art", comment: "")),
                        Tag(image: UIImage(named: "Cinema") ?? UIImage(),
                            selectedImage: UIImage(named: "SelectedCinema") ?? UIImage(),
                            name: NSLocalizedString("Cinema", comment: "")),
                        Tag(image: UIImage(named: "Food") ?? UIImage(),
                            selectedImage: UIImage(named: "SelectedFood") ?? UIImage(),
                            name: NSLocalizedString("Food", comment: "")),
                        Tag(image: UIImage(named: "Music") ?? UIImage(),
                            selectedImage: UIImage(named: "SelectedMusic") ?? UIImage(),
                            name: NSLocalizedString("Music", comment: "")),
                        Tag(image: UIImage(named: "Sport") ?? UIImage(),
                            selectedImage: UIImage(named: "SelectedSport") ?? UIImage(),
                            name: NSLocalizedString("Sport", comment: "")),
                        Tag(image: UIImage(named: "Society") ?? UIImage(),
                            selectedImage: UIImage(named: "SelectedSociety") ?? UIImage(),
                            name: NSLocalizedString("Society", comment: ""))]
}




