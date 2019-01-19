//
//  PromotionEntityDataMapper.swift
//  FVEC
//
//  Created by Enrique Canedo on 7/6/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import BaseRxApplication

final class PromotionEntityDataMapper: BaseEntityDataMapper<Promotion, PromotionEntity>, BaseDataMapper {
    
    func transform(entity: PromotionEntity?) -> Promotion {
        let domain = Promotion()
        if let entity = entity {
            if let name = entity.name {
                domain.name = name
            }
            if let coupon = entity.coupon {
                domain.coupon = coupon
            }
            if let description = entity.description {
                domain.description = description
            }
            if let topBanner = entity.topBanner {
                domain.topBanner = topBanner
            }
            if let bottomBanner = entity.bottomBanner {
                domain.bottomBanner = bottomBanner
            }
            if let discount = entity.discount, let doubleDiscount = Double(discount) {
                domain.discount = doubleDiscount
            }
            if let action = entity.action {
                switch action {
                case PromotionActionType.fixed.rawValue:
                    domain.action = PromotionActionType.fixed
                case PromotionActionType.percent.rawValue:
                    domain.action = PromotionActionType.percent
                default: break
                }
            }
        }
        return domain
    }
    
    func inverseTransform(domain: Promotion?) -> PromotionEntity {
        return PromotionEntity()
    }
    
}
