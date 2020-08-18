//
//  TagView.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 10.08.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit


class TagView: UIView {
    // MARK: - Properties
    private var imgView = UIImageView()
    private var image: UIImage!
    private var selectedImage: UIImage!
    private let name = UILabel()
    private var isSelected: Bool = false
    
    init() {
        super.init(frame: CGRect.zero)
        setAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Public methods
    func configure(with tag: Tag) {
        image = tag.image
        selectedImage = tag.selectedImage
        name.text = tag.name
        
        setDeselected()
    }
    
    func toggle() {
        if isSelected {
            setDeselected()
        } else {
            setSelected()
        }
        
        isSelected.toggle()
    }
    
    // MARK: Private methods
    private func setAppearance() {
        imgView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imgView)
        
        name.translatesAutoresizingMaskIntoConstraints = false
        name.isUserInteractionEnabled = false
        name.font = UIFont.boldSystemFont(ofSize: 20)
        name.sizeToFit()
        addSubview(name)
        
        NSLayoutConstraint.activate([
            imgView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imgView.heightAnchor.constraint(equalToConstant: 20),
            imgView.widthAnchor.constraint(equalToConstant: 20),
            
            name.centerYAnchor.constraint(equalTo: centerYAnchor),
            name.leadingAnchor.constraint(equalTo: imgView.trailingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            name.heightAnchor.constraint(equalToConstant: 28)
        ])
        
    }
    
    private func setSelected() {
        imgView.image = selectedImage
        backgroundColor = Colors.darkViolet
        name.textColor = Colors.white
    }
    
    private func setDeselected() {
        imgView.image = image
        backgroundColor = Colors.lightLavender
        name.textColor = Colors.darkViolet
    }
    
}
