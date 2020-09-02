//
//  Event.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 21.06.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class Event: Codable {
    // MARK: - Properties
    var id: Int
    var title: String
    var place: String
    var dateTime: Date
    var cost: Double
    var description: String?
    var titleImage: UIImage?
    var visitors: Visitors
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case place
        case dateTime
        case cost
        case description
        case titleImage
        case visitors
    }
    
    // MARK: - Public methods
    init(id: Int,
    title: String,
    place: String,
    dateTime: Date,
    cost: Double,
    description: String?,
    titleImage: UIImage?,
    visitors: Visitors) {
        self.id = id
        self.title = title
        self.cost = cost
        self.place = place
        self.dateTime = dateTime
        self.description = description
        self.titleImage = titleImage
        self.visitors = visitors
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        place = try container.decode(String.self, forKey: .place)
        cost = try container.decode(Double.self, forKey: .cost)
        description = try? container.decode(String.self, forKey: .description)
        
        let imgData = try? container.decode(Data.self, forKey: .titleImage)
        titleImage = UIImage(data: imgData!) ?? UIImage()
        
        let dateTimeString = try container.decode(String.self, forKey: .dateTime)
        dateTime = CustomDateFormatter.getEventDate(from: dateTimeString)
        
        visitors = try container.decode(Visitors.self, forKey: .visitors)
    }
    
    func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(place, forKey: .place)
        try container.encode(cost, forKey: .cost)
        try container.encode(description, forKey: .description)
        try container.encode(CustomDateFormatter.getEventDateString(from: dateTime), forKey: .dateTime)
        
        let imgData = titleImage?.pngData()
        try container.encode(imgData, forKey: .titleImage)
        
        try container.encode(visitors, forKey: .visitors)
    }
    
}
