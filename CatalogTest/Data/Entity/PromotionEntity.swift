//
//  PromotionEntity.swift
//  FVEC
//
//  Created by Enrique Canedo on 7/6/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import ObjectMapper
import BaseRxApplication

final class PromotionEntity: BaseEntity {
    
    var name: String? = nil
    var coupon: String? = nil
    var description: String? = nil
    var topBanner: String? = nil
    var bottomBanner: String? = nil
    var action: String? = nil
    var discount: String? = nil
    
    override func mapping(map: Map) {
        name            <- map["name"]
        coupon          <- map["coupon"]
        description     <- map["description"]
        topBanner       <- map["top_banner"]
        bottomBanner    <- map["bottom_banner"]
        action          <- map["simple_action"]
        discount        <- map["discount_amount"]
    }
    
}
