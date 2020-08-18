//
//  EventCardView.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 20.07.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class EventCardView: UIView {
    // MARK: - Properties
    private let titleImageView = UIImageView()
    private let dateView = DateView()
    private let title = UILabel()
    private let place = UILabel()
    private let visitorsPreview = VisitorsPreview()
    private let like = UIButton()
    
    // MARK: - Public methods
    init() {
        super.init(frame: CGRect.zero)
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ event: Event) {
        titleImageView.image = event.titleImage
        title.text = event.title
        
        let time = CustomDateFormatter.getTime(from: event.dateTime)
        place.text = "\(event.place), \(time)"
        
        dateView.configure(dateTime: event.dateTime)
        
        visitorsPreview.configure(visitors: event.visitors)
    }
    
    // MARK: - Private methods
    private func setAppearance() {
        layer.cornerRadius = 20
        backgroundColor = Colors.white
        
        titleImageView.translatesAutoresizingMaskIntoConstraints = false
        titleImageView.clipsToBounds = true
        titleImageView.contentMode = .scaleAspectFill
        addSubview(titleImageView)
        
        dateView.translatesAutoresizingMaskIntoConstraints = false
        bringSubviewToFront(dateView)
        addSubview(dateView)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 1
        title.lineBreakMode = .byTruncatingTail
        title.font = .boldSystemFont(ofSize: 16)
        title.textAlignment = .left
        addSubview(title)
        
        place.translatesAutoresizingMaskIntoConstraints = false
        place.numberOfLines = 1
        place.lineBreakMode = .byTruncatingTail
        place.font = .systemFont(ofSize: 14)
        place.textAlignment = .left
        place.textColor = Colors.gray
        addSubview(place)
        
        visitorsPreview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(visitorsPreview)
        
        like.translatesAutoresizingMaskIntoConstraints = false
        like.setImage(UIImage(named: "LikeButton"), for: .normal)
        like.setImage(UIImage(named: "SelectedLikeButton"), for: .selected)
        like.isUserInteractionEnabled = true
        like.layer.cornerRadius = 35/2
        like.addTarget(self, action: #selector(self.didTapLike), for: .touchUpInside)
        like.contentEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        addSubview(like)
        
        NSLayoutConstraint.activate([
            titleImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleImageView.topAnchor.constraint(equalTo: topAnchor),
            titleImageView.bottomAnchor.constraint(equalTo: centerYAnchor, constant: 10),
            
            dateView.centerYAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: -10),
            dateView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            title.topAnchor.constraint(equalTo: dateView.bottomAnchor, constant: 8),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            title.heightAnchor.constraint(equalToConstant: 20),
            
            place.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
            place.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            place.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            place.heightAnchor.constraint(equalToConstant: 15),
            
            visitorsPreview.topAnchor.constraint(equalTo: place.bottomAnchor, constant: 4),
            visitorsPreview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            visitorsPreview.trailingAnchor.constraint(equalTo: centerXAnchor),
            visitorsPreview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            like.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            like.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            like.widthAnchor.constraint(equalToConstant: 35),
            like.heightAnchor.constraint(equalToConstant: 35),
        ])
    }
    
    @objc
    private func didTapLike() {
        like.isSelected.toggle()
        
        UIView.animate(withDuration: 0.5, animations: {
            self.like.backgroundColor = Colors.lightLavender
            self.like.backgroundColor = .clear
        })
    }
    
}
