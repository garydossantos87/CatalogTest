//
//  GetCatalogsUseCase.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import RxSwift

protocol GetCatalogsUseCase {

    func execute() -> Single<[Catalog]>

}
