//
//  EventsLoader.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 30.06.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

protocol EventsLoader {
    func loadEvents(completion: @escaping ([EventTypes:[Event]]) -> Void)
    func loadSearchResults(searchText: String, completion: @escaping ([Event]) -> Void)
}

class EventsLoaderMock: EventsLoader {
    func loadSearchResults(searchText: String, completion: @escaping ([Event]) -> Void) {
                        let visitors = Visitors(images: [UIImage(named: "EventDefault") ?? UIImage(), UIImage(named: "EventDefault") ?? UIImage()], count: 101)
        let titleImage = UIImage(named: "EventDefault")
        
        let events1 = [Event(id: 1, title: "GO Home", place: "Home", dateTime: Calendar.current.date(byAdding: .month, value: 9, to: Date())!, cost: 30, description: "go and have a relax", titleImage: titleImage, visitors: visitors)]
        let events2 = [Event(id: 2, title: "Work", place: "In office", dateTime: Date(), cost: 50, description: "work hard", titleImage: titleImage, visitors: visitors),
                       Event(id: 3, title: "Rest", place: "Home", dateTime: Date(), cost: 60, description: "have a relax at home", titleImage: titleImage, visitors: visitors),
        Event(id: 4, title: "Hard Work", place: "Home", dateTime: Date(), cost: 60, description: "working at home", titleImage: titleImage, visitors: visitors)]
        let resultArray = events1 + events2
        let lowercasedQuery = searchText.lowercased()
        let results = resultArray.filter { $0.title.lowercased().contains(lowercasedQuery) }
        completion(results)
    }
    
    func loadEvents(completion: @escaping ([EventTypes:[Event]]) -> Void) {
        let visitors = Visitors(images: [UIImage(named: "EventDefault") ?? UIImage(), UIImage(named: "EventDefault") ?? UIImage()], count: 101)
        let titleImage = UIImage(named: "EventDefault")
        
        let events1 = [Event(id: 1, title: "GO Home", place: "Home", dateTime: Calendar.current.date(byAdding: .month, value: 9, to: Date())!, cost: 30, description: "something is written here", titleImage: titleImage, visitors: visitors)]
        let events2 = [Event(id: 2, title: "Work", place: "In office", dateTime: Date(), cost: 50, description: "work hard", titleImage: titleImage, visitors: visitors),
                       Event(id: 3, title: "Rest", place: "Home", dateTime: Date(), cost: 60, description: "have a relax at home", titleImage: titleImage, visitors: visitors)]
        completion([.promoted : events1, .thisWeek : events2])
    }
    
}
