//
//  String+Utils.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

extension String {

    func toDouble() -> Double? {
        return Double(self.replacingOccurrences(of: ",", with: "."))
    }

}
