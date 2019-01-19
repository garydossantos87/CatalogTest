//
//  BaseWireframe+NavigationHelper.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

extension BaseWireframe {

    func displayCatalogs(withCatalogs catalogs: [Catalog]) {
        let viewController = CatalogueViewController()
        viewController.viewModel.setup(withCatalogs: catalogs)
        let navigationController = CatalogBaseNavigationController()
        navigationController.setViewControllers([viewController], animated: true)
        rootViewController(withNavigationController: navigationController)
    }

}
