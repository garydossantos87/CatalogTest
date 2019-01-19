//
//  CatalogEntityDataMapper.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

final class CatalogEntityDataMapper: BaseEntityDataMapper<Catalog, CatalogEntity>, BaseDataMapper {

    private let couponEntityDataMapper = CouponEntityDataMapper()
    private let nearestStoreEntityDataMapper = NearestStoreEntityDataMapper()

    func transform(entity: CatalogEntity?) -> Catalog {
        var domain = Catalog()
        if let entity = entity {
            if let parserDomain = Catalog(JSON: entity.toJSON()) {
                domain = parserDomain
            }
            if let couponEntity = entity.coupon {
                domain.coupon = couponEntityDataMapper.transform(entity: couponEntity)
            }
            if let nearestStoreEntity = entity.nearestStore {
                domain.nearestStore = nearestStoreEntityDataMapper.transform(entity: nearestStoreEntity)
            }
            if let date = entity.dateEnd, let dateEnd = Double(date) {
                domain.dateEnd = Date(timeIntervalSince1970: dateEnd)
            }
        }
        return domain
    }

    func inverseTransform(domain: Catalog?) -> CatalogEntity {
        var entity = CatalogEntity()
        if let domain = domain, let parsedEntity = CatalogEntity(JSON: domain.toJSON()) {
            entity = parsedEntity
        }
        return entity
    }

}
