//
//  ErrorEntity.swift
//  BaseRxApplicationExamples
//
//  Created by Enrique Canedo on 6/3/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import BaseRxApplication
import ObjectMapper

final class ErrorEntity: BaseErrorEntity {
    
    var codeInt = 0
    
    override func mapping(map: Map) {
        codeInt     <- map["code"]
        message     <- map["raw"]
        raw         <- map["message"]
    }
    
    public static func unknown() -> ErrorEntity {
        return ErrorEntity(code: "", message: "unexpected_error_message".localized, raw: "unexpected_error_message".localized)
    }
    
}
