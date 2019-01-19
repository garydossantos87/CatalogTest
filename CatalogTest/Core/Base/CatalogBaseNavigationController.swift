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
        return .lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavBar(backgroundImage: UIImage.imageFromColor(withColor: ThemeColor.thunderbird.color()), tintColor: ThemeColor.white.color(), titleFont: ThemeFont.bold_16.font(), shadowImage: Constants.shadowNavigationBarImage)
        
    }
    
}
