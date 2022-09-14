//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Bugra Ates on 9/13/22.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
