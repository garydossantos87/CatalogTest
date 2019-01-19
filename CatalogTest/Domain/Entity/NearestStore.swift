//
//  NearestStore.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import ObjectMapper
import BaseRxApplication

final class NearestStore: BaseEntity {

    var distance: String = ""
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var phone: String = ""
    var address: String = ""
    var city: String = ""
    var id: String = ""
    var name: String = ""
    var zipcode: String = ""
    var web: String = ""

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
