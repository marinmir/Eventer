//
//  ViewController.swift
//  Eventer
//
//  Created by Мирошниченко Марина on 11.06.2020.
//  Copyright © 2020 Мирошниченко Марина. All rights reserved.
//

import UIKit

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {
    // MARK: - Properties
    private let feedsTabController = FeedsViewController()
    private let mapTabController = MapViewController()
    private let addEventTabController = AddEventViewController()
    private let favoritesTabController = FavoritesViewController()
    private let profileTabController = ProfileViewController()
    
    // MARK: - Public methods
    override func viewDidLoad() -> Void {
        super.viewDidLoad()
        
        delegate = self
        tabBar.tintColor = Colors.darkViolet
        tabBar.backgroundColor = UIColor.white
    }
    
    override func viewWillAppear(_ animated: Bool) -> Void {
        super.viewWillAppear(animated)
        
        createTabs()
        
        viewControllers = [feedsTabController, mapTabController, addEventTabController, favoritesTabController, profileTabController]
    }
    
    // MARK: - Private methods
    private func createTabs() -> Void {
        createFeedsTab()
        
        createMapTab()
        
        createAddEventTab()
        
        createFavoritesTab()
        
        createProfileTab()
    }
    
    private func createFeedsTab() -> Void {
        let feedsTabItem = UITabBarItem(title: nil, image: UIImage(named: "Poster"), selectedImage: UIImage(named: "Poster"))
        
        // Move the tabbar icon to the middle of tabbar
        feedsTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0);
        if #available(iOS 13.0, *) {
            //feedsTabItem.standardAppearance?.selectionIndicatorTintColor = Colors.darkViolet
        }

        feedsTabController.tabBarItem = feedsTabItem
    }
    
    private func createMapTab() -> Void {
        let mapTabItem = UITabBarItem(title: nil, image: UIImage(named: "Map"), selectedImage: UIImage(named: "Map"))
        
        // Move the tabbar icon to the middle of tabbar
        mapTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        mapTabController.tabBarItem = mapTabItem
    }
    
    private func createAddEventTab() -> Void {
        let addEventTabItem = UITabBarItem(title: nil, image: UIImage(named: "AddEvent"), selectedImage: UIImage(named: "AddEvent"))
        
        // Move the tabbar icon to the middle of tabbar
        addEventTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        addEventTabController.tabBarItem = addEventTabItem
    }
    
    private func createFavoritesTab() -> Void {
        let favoritesTabItem = UITabBarItem(title: nil, image: UIImage(named: "Favorites"), selectedImage: UIImage(named: "Favorites"))
        
        //Move the tabbar icon to the middle of tabbar
        favoritesTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        favoritesTabController.tabBarItem = favoritesTabItem
    }
    
    private func createProfileTab() -> Void {
        let profileTabItem = UITabBarItem(title: nil, image: UIImage(named: "Profile"), selectedImage: UIImage(named: "Profile"))
        
        //Move tabbar icon to the middle of tabbar
        profileTabItem.imageInsets = UIEdgeInsets(top: 6.0, left: 0.0, bottom: -6.0, right: 0.0)
        
        profileTabController.tabBarItem = profileTabItem
    }
}
