//
//  CatalogRepository.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import RxSwift

protocol CatalogRepository {

    func retrieve() -> Single<[Catalog]>

}

