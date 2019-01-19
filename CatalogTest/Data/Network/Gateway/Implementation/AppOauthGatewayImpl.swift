//
//  AppOauthGatewayImpl.swift
//  FVEC
//
//  Created by Enrique Canedo on 04/04/2018.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import RxSwift
import BaseRxApplication

final class AppOauthGatewayImpl: AppOauthGateway {
    
    static let shared = AppOauthGatewayImpl()
    private var appOathService = AppOauthService()
    
    private init() {}
    
}
