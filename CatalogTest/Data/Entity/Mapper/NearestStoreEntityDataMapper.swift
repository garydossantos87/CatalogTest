//
//  NearestStoreEntityDataMapper.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

final class NearestStoreEntityDataMapper: BaseEntityDataMapper<NearestStore, NearestStoreEntity>, BaseDataMapper {

    func transform(entity: NearestStoreEntity?) -> NearestStore {
        var domain = NearestStore()
        if let entity = entity {
            if let parserDomain = NearestStore(JSON: entity.toJSON()) {
                domain = parserDomain
            }
            if let lat = entity.latitude, let latitude = lat.toDouble() {
                domain.latitude = latitude
            }
            if let long = entity.longitude, let longitude = long.toDouble() {
                domain.longitude = longitude
            }
        }
        return domain
    }

    func inverseTransform(domain: NearestStore?) -> NearestStoreEntity {
        var entity = NearestStoreEntity()
        if let domain = domain, let parsedEntity = NearestStoreEntity(JSON: domain.toJSON()) {
            entity = parsedEntity
        }
        return entity
    }

}
