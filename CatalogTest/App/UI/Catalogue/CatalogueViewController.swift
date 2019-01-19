//
//  CatalogueViewController.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication
import RxSwift

final class CatalogueViewController: CatalogueBaseViewController<CatalogueViewModel>  {

    override func createViewModel() -> CatalogueViewModel {
        return CatalogueViewModel()
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
