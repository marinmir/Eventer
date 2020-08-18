//
//  EventCollectionCell.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 26.06.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class EventCollectionCell: UICollectionViewCell {
    // MARK: - Properties
    static let cellReuseIdentifier = String(describing: EventCollectionCell.self)
    private let eventCard = EventCardView()

    // MARK: - Public methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setApperance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with event: Event) {
        eventCard.configure(event)
    }
    
    // MARK: - Private methods
    private func setApperance() {
        layer.shadowColor = UIColor(red: 120/256, green: 120/256, blue: 120/256, alpha: 1).cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 5, height: 5)
        layer.masksToBounds = false
        
        eventCard.translatesAutoresizingMaskIntoConstraints = false
        eventCard.layer.masksToBounds = true
        contentView.addSubview(eventCard)
        
        NSLayoutConstraint.activate([
            eventCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            eventCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            eventCard.topAnchor.constraint(equalTo: topAnchor),
            eventCard.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}
