//
//  SearchResultsNotFoundView.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 18.08.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class SearchResultsNotFoundView: UIView {
    init() {
        super.init(frame: CGRect.zero)
        
        setSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubviews() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sorry, not found"
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
}
