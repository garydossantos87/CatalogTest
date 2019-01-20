//
//  SplashViewController.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

final class SplashViewController: CatalogueBaseViewController<SplashViewModel> {

    override func createViewModel() -> SplashViewModel {
        return SplashViewModel()
    }

}
