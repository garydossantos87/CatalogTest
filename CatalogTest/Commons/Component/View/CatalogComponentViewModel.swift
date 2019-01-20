//
//  CatalogComponentViewModel.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import RxSwift

final class CatalogComponentViewModel {

    let name = BehaviorSubject<String?>(value: nil)
    let date = BehaviorSubject<String?>(value: nil)
    let favorite = BehaviorSubject(value: ThemeImage.favorite.image())
    let share = BehaviorSubject(value: ThemeImage.share.image())
    let save = BehaviorSubject(value: ThemeImage.save.image())
    let type = BehaviorSubject<CatalogType?>(value: nil)
    let coupon = BehaviorSubject(value: "coupon".localized.uppercased())

    // ----------------------------
    // MARK: - Public methods 🔓
    // ----------------------------

    func setup(withCatalogModel catalogModel: CatalogModel) {
        name.onNext(catalogModel.name)
        date.onNext(catalogModel.date)
        type.onNext(catalogModel.type)
    }
    
}
