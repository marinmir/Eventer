//
//  VisitorsPreview.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 27.07.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class VisitorsPreview: UIStackView {
    // MARK: - Properties
    private let count = UILabel()
    private var profileImages: [UIImage]!
    private let profilesStack = UIStackView()
    
    // MARK: - Public methods
    func configure(visitors: Visitors) {
        profileImages = visitors.profileImages
        
        if visitors.visitorsCount > 0 {
           count.text = "+\(visitors.visitorsCount)"
        }
        
        cleanStackView()
       
        for img in 0..<min(4, profileImages.count) {
            let profileImageView = UIImageView(image: profileImages[img])
            profileImageView.translatesAutoresizingMaskIntoConstraints = false
            profilesStack.addArrangedSubview(profileImageView)
            
            profileImageView.layer.cornerRadius = 14
            profileImageView.layer.masksToBounds = true
            
            profileImageView.layer.borderWidth = 2
            profileImageView.layer.borderColor = Colors.white.cgColor
            
            NSLayoutConstraint.activate([
                profileImageView.widthAnchor.constraint(equalToConstant: 28),
                profileImageView.heightAnchor.constraint(equalToConstant: 28)
            ])
        }
        
        axis = .horizontal
        spacing = 2
        alignment = .center
        
        profilesStack.axis = .horizontal
        profilesStack.spacing = -10
        profilesStack.alignment = .center
        addArrangedSubview(profilesStack)
        
        count.translatesAutoresizingMaskIntoConstraints = false
        count.textColor = Colors.black
        count.textAlignment = .left
        count.font = .systemFont(ofSize: 10)
        addArrangedSubview(count)
    }
    
    // MARK: - Private methods
    func cleanStackView() {
        let viewsInStack = profilesStack.arrangedSubviews
        
        for view in viewsInStack {
           profilesStack.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
}
