//
//  CatalogueViewModel.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

final class CatalogueViewModel: BaseViewModel {

    private var catalogs: [Catalog]?

    // ----------------------------
    // MARK: - Public methods 🔓
    // ----------------------------

    func setup(withCatalogs catalogs: [Catalog]) {
        self.catalogs = catalogs
    }

    // ---------------------------------------
    // MARK: - Setup MultiLanguage 🌍
    // ---------------------------------------

    override func setupStaticStrings() {
        super.setupStaticStrings()

        navigationBarTitle.value = "Catálogos"
    }

}
