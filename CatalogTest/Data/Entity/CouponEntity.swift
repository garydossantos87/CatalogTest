//
//  CouponEntity.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import ObjectMapper
import BaseRxApplication

final class CouponEntity: BaseEntity {

    var description: String? = nil

    override func mapping(map: Map) {
        description            <- map["description"]
    }

}
