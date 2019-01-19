//
//  CatalogViewCellModel.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication
import RxSwift

final class CatalogViewCellModel {

    let catalogModel = BehaviorSubject<CatalogModel?>(value: nil)

    // ----------------------------
    // MARK: - Public methods 🔓
    // ----------------------------

    func setup(withCatalogModel catalogModel: CatalogModel) {
        self.catalogModel.onNext(catalogModel)
    }

}
