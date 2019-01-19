//
//  CouponEntityDataMapper.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

final class CouponEntityDataMapper: BaseEntityDataMapper<Coupon, CouponEntity>, BaseDataMapper {

    func transform(entity: CouponEntity?) -> Coupon {
        var domain = Coupon()
        if let entity = entity, let parserDomain = Coupon(JSON: entity.toJSON()) {
            domain = parserDomain
        }
        return domain
    }

    func inverseTransform(domain: Coupon?) -> CouponEntity {
        var entity = CouponEntity()
        if let domain = domain, let parsedEntity = CouponEntity(JSON: domain.toJSON()) {
            entity = parsedEntity
        }
        return entity
    }

}
