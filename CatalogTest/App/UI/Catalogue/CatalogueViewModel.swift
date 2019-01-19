//
//  CatalogueViewModel.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

final class CatalogueViewModel: BaseViewModel {

    private let catalogModelDataMapper = CatalogModelDataMapper()
    private var catalogs: [Catalog]?
    private var catalogsModel: [CatalogModel] = []

    // ----------------------------
    // MARK: - Public methods 🔓
    // ----------------------------

    func setup(withCatalogs catalogs: [Catalog]) {
        self.catalogs = catalogs
        self.catalogsModel = catalogModelDataMapper.transform(entityList: catalogs)
    }

    func numberOfRows(section: Int) -> Int {
        return catalogsModel.count
    }

    func cellIdentifier(indexPath: IndexPath) -> String {
        return CatalogViewCell.reuseIdentifier
    }

    func cellViewModel(indexPath: IndexPath) -> CatalogViewCellModel {
        let catalogModel = catalogsModel[indexPath.row]
        let viewModel = CatalogViewCellModel()
        viewModel.setup(withCatalogModel: catalogModel)
        return viewModel
    }

//    func onBottomContainerPushed(type: ClusterMapDetailType, parkingIndexPath: IndexPath) {
//        
//    }

    // ---------------------------------------
    // MARK: - Setup MultiLanguage 🌍
    // ---------------------------------------

    override func setupStaticStrings() {
        super.setupStaticStrings()

        navigationBarTitle.value = "catalogs".localized.uppercased()
    }

}
