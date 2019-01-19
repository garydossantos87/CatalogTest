//
//  GetPromotionListUseCase.swift
//  FVEC
//
//  Created by Enrique Canedo on 7/6/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import RxSwift

protocol GetPromotionListUseCase {
    
    func execute() -> Single<[Promotion]>
    
}
