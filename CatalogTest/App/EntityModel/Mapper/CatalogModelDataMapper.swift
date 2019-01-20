//
//  CatalogModelDataMapper.swift
//  FVEC
//
//  Created by Enrique Canedo on 7/6/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import BaseRxApplication

final class CatalogModelDataMapper: BaseModelDataMapper<CatalogModel, Catalog>, BaseDataMapper {
    
    func transform(entity: Catalog?) -> CatalogModel {
        var model = CatalogModel()
        if let entity = entity {
            model.id = entity.id
            model.name = entity.retailerName
            model.date = entity.dateEnd.toString(withFormat: Constants.dateFormat)
            model.type = entity.coupon == nil ? .catalog : .coupon
            model.couponDescription = entity.coupon?.description ?? ""
            if let nearestStore = entity.nearestStore {
                model.web = nearestStore.web
                model.phone = nearestStore.phone
                model.address = "\(nearestStore.address), \(nearestStore.city) \(nearestStore.zipcode)"
                model.distance = nearestStore.distance.convertDistance()
            }
            return model
        }
        return model
    }
    
    func inverseTransform(domain model: CatalogModel?) -> Catalog {
        return Catalog()
    }
    
}
