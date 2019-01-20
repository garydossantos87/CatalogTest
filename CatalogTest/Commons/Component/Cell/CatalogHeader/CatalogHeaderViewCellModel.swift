//
//  CatalogHeaderViewCellModel.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 20/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication
import RxSwift

final class CatalogHeaderViewCellModel {

    let title = BehaviorSubject<String?>(value: nil)

    // ----------------------------
    // MARK: - Public methods 🔓
    // ----------------------------

    func setup(withTitle title: String) {
        self.title.onNext(title)
    }

}

