//
//  PromotionModelDataMapper.swift
//  FVEC
//
//  Created by Enrique Canedo on 7/6/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import BaseRxApplication

final class PromotionModelDataMapper: BaseModelDataMapper<PromotionModel, Promotion>, BaseDataMapper {
    
    func transform(entity: Promotion?) -> PromotionModel {
        var model = PromotionModel()
        if let entity = entity {
            model.name = entity.name
            model.coupon = entity.coupon
            model.topBanner = entity.topBanner
            model.bottomBanner = entity.bottomBanner
            model.discount = entity.discount
            model.action = entity.action
            return model
        }
        return model
    }
    
    func inverseTransform(domain model: PromotionModel?) -> Promotion {
        return Promotion()
    }
    
}
