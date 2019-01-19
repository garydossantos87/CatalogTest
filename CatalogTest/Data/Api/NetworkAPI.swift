//
//  NetworkAPI.swift
//  FVEC
//
//  Created by Enrique Canedo on 5/3/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import Alamofire
import BaseRxApplication
import ObjectMapper

enum NetworkAPI {
    
    case catalogs
}

extension NetworkAPI: API {
    
    var headers: [String : String]? {
        return nil
    }
    
    var baseUrl: String {
        return "https://interview-ios.firebaseio.com/"
    }
    
    var path: String {
        switch self {
        case .catalogs:
            return "offers.json"
        }
    }

    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }

    var encodeType: EncodeType {
        switch self {
        default:
            return .json
        }
    }

    var oauth: Bool {
        switch self {
        default:
            return true
        }
    }

    var parameters: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }

    var error: BaseErrorEntity {
        return ErrorEntity()
    }

    var adapter: BaseRequestAdapter? {
        return BaseRequestAdapter(request: self)
    }

    var logLevel: LogLevel {
        return .none
    }

}
