//
//  Visitors.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 27.07.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

struct Visitors: Codable {
    // MARK: - Properties
    var profileImages: [UIImage]
    var visitorsCount: Int
    
    enum CodingKeys: String, CodingKey {
        case profileImages
        case visitorsCount
    }
    
    // MARK: - Public Methods
    init(images: [UIImage], count: Int) {
        profileImages = images
        visitorsCount = count
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let imgData = try? container.decode([Data].self, forKey: .profileImages) {
            profileImages = imgData.map { UIImage(data: $0) ?? UIImage() }
        }
        else {
            profileImages = []
        }
        visitorsCount = try container.decode(Int.self, forKey: .visitorsCount)
    }
    
    func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        let imgData = profileImages.map { $0.pngData() }
        try container.encode(imgData, forKey: .profileImages)
        
        try container.encode(visitorsCount, forKey: .visitorsCount)
    }
    
}
