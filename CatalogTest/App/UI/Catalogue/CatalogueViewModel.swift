//
//  CatalogueViewModel.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

final class CatalogueViewModel: BaseViewModel {
    private enum CatalogSections: Int {
        case catalog = 0, coupon, sections

        static func with(section: Int) -> CatalogSections {
            switch section {
            case 0:
                return .catalog
            case 1:
                return .coupon
            default:
                return .sections
            }
        }
    }
    private let catalogHeight: CGFloat = 1.8
    private let couponHeight: CGFloat = 1.5
    private let catalogModelDataMapper = CatalogModelDataMapper()
    private var catalogs: [Catalog]?
    private var catalogsModel: [CatalogModel] = []
    private var couponsModel: [CatalogModel] = []

    // ----------------------------
    // MARK: - Public methods 🔓
    // ----------------------------

    func setup(withCatalogs catalogs: [Catalog]) {
        self.catalogs = catalogs
        let catalogsModelTransform = catalogModelDataMapper.transform(entityList: catalogs)
        catalogsModel = catalogsModelTransform.filter { $0.type == .catalog }
        couponsModel = catalogsModelTransform.filter { $0.type == .coupon }
    }

    // ----------------------------
    // MARK: - UICollectionView
    // ----------------------------

    func numberOfRows(section: Int) -> Int {
        switch CatalogSections.with(section: section) {
        case .catalog:
            return catalogsModel.count
        case .coupon:
            return couponsModel.count
        default:
            return Int(Constants.zero)
        }
    }

    func numberOfSections() -> Int {
        var sectionsQuantity = CatalogSections.catalog.rawValue
        if !catalogsModel.isEmpty {
            sectionsQuantity  += 1
        }
        if !couponsModel.isEmpty{
            sectionsQuantity  += 1
        }
        return sectionsQuantity
    }

    func cellIdentifier(indexPath: IndexPath) -> String {
        return CatalogViewCell.reuseIdentifier
    }

    func titleForHeaderInSection(_ section: Int) -> String {
        switch CatalogSections.with(section: section) {
        case .catalog:
            return "catalog".localized.uppercased()
        default:
            return "coupon".localized.uppercased()
        }
    }

    func cellViewModel(indexPath: IndexPath) -> BaseCellViewModel {
        switch CatalogSections.with(section: indexPath.section) {
        case .catalog where catalogsModel.indices.contains(indexPath.row):
            let viewModel = CatalogViewCellModel()
            viewModel.setup(withCatalogModel: catalogsModel[indexPath.row])
            return viewModel
        case .coupon where couponsModel.indices.contains(indexPath.row):
            let viewModel = CatalogViewCellModel()
            viewModel.setup(withCatalogModel: couponsModel[indexPath.row])
            return viewModel
        default:
            return BaseCellViewModel()
        }
    }

    func heightByType(indexPath: IndexPath) -> CGFloat {
        return CatalogSections.with(section: indexPath.section) == .catalog ? catalogHeight : couponHeight
    }

    func didSelectItemAt(indexPath: IndexPath) {
        switch CatalogSections.with(section: indexPath.section) {
        case .catalog where catalogsModel.indices.contains(indexPath.row):
            print(catalogsModel[indexPath.row].name)
        case .coupon where couponsModel.indices.contains(indexPath.row):
            print(couponsModel[indexPath.row].name)
        default: break
        }
    }

    // ---------------------------------------
    // MARK: - Setup MultiLanguage 🌍
    // ---------------------------------------

    override func setupStaticStrings() {
        super.setupStaticStrings()

        navigationBarTitle.value = "catalogs".localized.uppercased()
    }

}
