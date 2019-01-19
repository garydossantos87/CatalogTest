//
//  CatalogRepositoryImpl.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import RxSwift

final class CatalogRepositoryImpl: CatalogRepository {

    private let restAPI = AppGatewayImpl.shared
    private let catalogEntityDataMapper = CatalogEntityDataMapper()

    func retrieve() -> Single<[Catalog]> {
        return restAPI.retrieveCatalogs()
            .map { catalogsEntity -> [Catalog] in
                return self.catalogEntityDataMapper.transform(entityList: catalogsEntity)
        }
    }

}

