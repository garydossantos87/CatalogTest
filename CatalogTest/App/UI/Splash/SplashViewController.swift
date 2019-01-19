//
//  SplashViewController.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

final class SplashViewController: BaseViewController<SplashViewModel> {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }

    override func createViewModel() -> SplashViewModel {
        return SplashViewModel()
    }

    // ----------------------------
    // MARK: - Setups
    // ----------------------------

    override func setupLayout() {
        super.setupLayout()

    }

    override func setupRx() {
        super.setupRx()
    }

}
