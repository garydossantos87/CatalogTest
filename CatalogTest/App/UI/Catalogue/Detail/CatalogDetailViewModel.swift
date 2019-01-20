//
//  CatalogDetailViewModel.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 20/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication
import RxSwift

final class CatalogDetailViewModel: BaseViewModel {

    private let catalogModelDataMapper = CatalogModelDataMapper()
    let catalogModel = Variable<CatalogModel?>(nil)
    let addressImage = BehaviorSubject(value: ThemeImage.marker.image().tint(withColor: ThemeColor.chatelle.color()))
    let phoneImage = BehaviorSubject(value: ThemeImage.phone.image().tint(withColor: ThemeColor.chatelle.color()))
    let webImage = BehaviorSubject(value: ThemeImage.web.image().tint(withColor: ThemeColor.chatelle.color()))
    let directionImage = BehaviorSubject(value: ThemeImage.direction.image().tint(withColor: ThemeColor.thunderbird.color()))
    let couponImage = BehaviorSubject(value: ThemeImage.couponDescription.image().tint(withColor: ThemeColor.chatelle.color()))
    let walkImage = BehaviorSubject(value: ThemeImage.walk.image().tint(withColor: ThemeColor.chatelle.color()))

    // ----------------------------
    // MARK: - Public methods 🔓
    // ----------------------------

    func setup(withCatalog catalog: Catalog) {
        catalogModel.value = catalogModelDataMapper.transform(entity: catalog)
    }

    // ---------------------------------------
    // MARK: - Setup MultiLanguage 🌍
    // ---------------------------------------

    override func setupStaticStrings() {
        super.setupStaticStrings()

        navigationBarTitle.value = "store_detail".localized.uppercased()
    }

}
