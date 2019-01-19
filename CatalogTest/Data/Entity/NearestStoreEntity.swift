//
//  NearestStoreEntity.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import ObjectMapper
import BaseRxApplication

final class NearestStoreEntity: BaseEntity {

    var distance: String? = nil
    var latitude: String? = nil
    var longitude: String? = nil
    var phone: String? = nil
    var address: String? = nil
    var city: String? = nil
    var id: String? = nil
    var name: String? = nil
    var zipcode: String? = nil
    var web: String? = nil

    override func mapping(map: Map) {
        distance        <- map["distance"]
        latitude        <- map["latitude"]
        longitude       <- map["longitude"]
        phone           <- map["phone_number"]
        address         <- map["store_address"]
        city            <- map["store_city"]
        id              <- map["store_id"]
        name            <- map["store_name"]
        zipcode         <- map["store_zip_code"]
        web             <- map["web_url"]
    }

}
