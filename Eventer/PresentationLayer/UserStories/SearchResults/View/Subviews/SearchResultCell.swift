//
//  SearchResultCell.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 15.08.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class SearchResultCell: UITableViewCell {
    // MARK: - Properties
    static let cellReuseIdentifier = String(describing: SearchResultCell.self)
    private let titleImage = UIImageView()
    private let title = UILabel()
    private let date = UILabel()
    private let place = UILabel()
    private let cost = UILabel()
    
    // MARK: - Public methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with result: Event) {
        titleImage.image = result.titleImage
        title.text = result.title
        date.text = CustomDateFormatter.toString(from: result.dateTime)
        place.text = result.place
        cost.text = String(result.cost)
    }
    
    // MARK: - Private methods
    private func setAppearance() {
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleImage.clipsToBounds = true
        titleImage.contentMode = .scaleAspectFill
        titleImage.layer.cornerRadius = 45
        contentView.addSubview(titleImage)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 1
        title.lineBreakMode = .byTruncatingTail
        title.font = .boldSystemFont(ofSize: 20)
        title.textAlignment = .left
        contentView.addSubview(title)
        
        date.translatesAutoresizingMaskIntoConstraints = false
        date.numberOfLines = 1
        date.lineBreakMode = .byTruncatingTail
        date.font = .systemFont(ofSize: 16)
        date.textAlignment = .left
        date.textColor = Colors.gray
        contentView.addSubview(date)
        
        place.translatesAutoresizingMaskIntoConstraints = false
        place.numberOfLines = 1
        place.lineBreakMode = .byTruncatingTail
        place.font = .systemFont(ofSize: 16)
        place.textAlignment = .left
        place.textColor = Colors.gray
        contentView.addSubview(place)
        
        cost.translatesAutoresizingMaskIntoConstraints = false
        cost.numberOfLines = 1
        cost.lineBreakMode = .byTruncatingTail
        cost.font = .systemFont(ofSize: 16)
        cost.textAlignment = .left
        cost.textColor = Colors.gray
        contentView.addSubview(cost)
        
        NSLayoutConstraint.activate([
            titleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            titleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleImage.heightAnchor.constraint(equalToConstant: 90),
            titleImage.widthAnchor.constraint(equalToConstant: 90),
            
            title.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: 8),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            title.centerYAnchor.constraint(equalTo: titleImage.centerYAnchor, constant: -20),
            title.heightAnchor.constraint(equalToConstant: 20),
            
            cost.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: 8),
            cost.centerYAnchor.constraint(equalTo: titleImage.centerYAnchor),
            cost.heightAnchor.constraint(equalToConstant: 18),
            cost.widthAnchor.constraint(greaterThanOrEqualToConstant: 40),
            
            place.leadingAnchor.constraint(equalTo: cost.trailingAnchor, constant: 2),
            place.centerYAnchor.constraint(equalTo: cost.centerYAnchor),
            place.heightAnchor.constraint(equalToConstant: 18),
            //place.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            place.widthAnchor.constraint(greaterThanOrEqualToConstant: 80),
            
            date.leadingAnchor.constraint(equalTo: titleImage.trailingAnchor, constant: 8),
            date.centerYAnchor.constraint(equalTo: titleImage.centerYAnchor, constant: 18),
            date.heightAnchor.constraint(equalToConstant: 18),
            date.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
    }
    
}
