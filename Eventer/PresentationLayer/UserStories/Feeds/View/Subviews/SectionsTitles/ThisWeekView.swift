//
//  ThisWeekendView.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 28.07.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class ThisWeekView: UIView {
    // MARK: - Properties
    let title = UILabel()

    // MARK: - Public methods
    init() {
        super.init(frame: CGRect.zero)
        
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = NSLocalizedString("This week", comment: "")
        title.font = .boldSystemFont(ofSize: TitlesConstants.font)
        addSubview(title)
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: TitlesConstants.leading),
            title.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
