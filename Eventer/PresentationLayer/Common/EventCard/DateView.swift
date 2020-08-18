//
//  DateView.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 30.06.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

class DateView: UIView {
    // MARK: - Properties
    private let dayLabel = UILabel()
    private let monthLabel = UILabel()
    
    // MARK: - Public methods
    func configure(dateTime: Date) {
        layer.cornerRadius = 9
        backgroundColor = Colors.white
        layer.shadowColor = UIColor(red: 120/256, green: 120/256, blue: 120/256, alpha: 1).cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 5)
        
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        let day = String(Calendar.current.component(.day, from: dateTime))
        dayLabel.text = day
        dayLabel.textColor = Colors.darkViolet
        dayLabel.textAlignment = .center
        dayLabel.font = .boldSystemFont(ofSize: 20)
        dayLabel.adjustsFontSizeToFitWidth = true
        addSubview(dayLabel)
        
        monthLabel.translatesAutoresizingMaskIntoConstraints = false
        let month = CustomDateFormatter.getShortMonthName(from: dateTime)
        monthLabel.text = month
        monthLabel.textColor = Colors.black
        monthLabel.textAlignment = .center
        monthLabel.font = .systemFont(ofSize: 14)
        monthLabel.adjustsFontSizeToFitWidth = true
        addSubview(monthLabel)
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 50),
            heightAnchor.constraint(equalToConstant: 50),
            
            dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            dayLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            dayLabel.heightAnchor.constraint(equalToConstant: 25),
            
            monthLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: -2),
            monthLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            monthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4),
            monthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
        ])
    }

}
