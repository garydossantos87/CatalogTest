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

    func convertDistance() -> String {
        guard let distance = self.toDouble() else { return self }

        if distance > 1.0 {
            return String(format: "%.0f Km", distance)
        } else {
            return String(format: "%.0f m", distance * 1000)
        }
    }

}
