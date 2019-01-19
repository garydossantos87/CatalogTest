//
//  CatalogBaseNavigationController.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

final class CatalogBaseNavigationController: BaseNavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar(backgroundImage: UIImage.imageFromColor(withColor: ThemeColor.tundora.color()), tintColor: ThemeColor.white.color(), titleFont: ThemeFont.bold_14.font(), shadowImage: Constants.shadowNavigationBarImage)
        
    }
    
}
