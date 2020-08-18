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
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        addSubview(container)
        
        let message = UILabel()
        message.translatesAutoresizingMaskIntoConstraints = false
        message.text = NSLocalizedString("Sorry, not found", comment: "")
        message.textColor = Colors.darkViolet
        message.font = .systemFont(ofSize: 25)
        addSubview(message)
        
        let sadSmile = UIImageView(image: UIImage(named: "SadSmile"))
        sadSmile.translatesAutoresizingMaskIntoConstraints = false
        addSubview(sadSmile)
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            container.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            container.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            
            message.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: -25),
            message.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            sadSmile.centerYAnchor.constraint(equalTo: container.centerYAnchor, constant: 25),
            sadSmile.centerXAnchor.constraint(equalTo: centerXAnchor),
            sadSmile.widthAnchor.constraint(equalToConstant: 50),
            sadSmile.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
}
