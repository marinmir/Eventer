//
//  PromotedView.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 28.07.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class PromotedView: UIView {
    // MARK: - Public methods
    init() {
        super.init(frame: CGRect.zero)
        
        let title = UILabel()
        let crownImage = UIImage(named: "Crown")
        let crown = UIImageView(image: crownImage)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = NSLocalizedString("Promoted", comment: "")
        title.font = .boldSystemFont(ofSize: TitlesConstants.font)
        addSubview(title)
        
        crown.translatesAutoresizingMaskIntoConstraints = false
        crown.transform = crown.transform.rotated(by: .pi/4)
        addSubview(crown)
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: TitlesConstants.leading),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
            title.heightAnchor.constraint(equalToConstant: 25),
            
            crown.topAnchor.constraint(equalTo: topAnchor),
            crown.leadingAnchor.constraint(equalTo: title.trailingAnchor),
            crown.bottomAnchor.constraint(equalTo: title.centerYAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
