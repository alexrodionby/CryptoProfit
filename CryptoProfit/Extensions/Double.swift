//
//  Double.swift
//  CryptoProfit
//
//  Created by Alexandr Rodionov on 31.08.22.
//

// MARK: Расширение для дабла, чтобы нормально округлять значения валют из джейсона

import Foundation

extension Double {
    
    /// Конвертируем значение Double в значение валюты с 2 знаками после запятой
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current         // это значит по умлчанию
        formatter.currencyCode = "usd"      // меняем валюту
        formatter.currencySymbol = "$"      // меняем значок валюты
        formatter.minimumFractionDigits = 2 // минимум после запятой
        formatter.maximumFractionDigits = 2 // максимум после запятой
        return formatter
    }
    
    /// Конвертируем значение Double в строку со значением валюты с 2-6 знаками после запятой
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.34"
    /// Convert 0.123456 to "$0.12"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    /// Конвертируем значение Double в значение валюты с 2-6 знаками после запятой
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.locale = .current         // это значит по умлчанию
        formatter.currencyCode = "usd"      // меняем валюту
        formatter.currencySymbol = "$"      // меняем значок валюты
        formatter.minimumFractionDigits = 2 // минимум после запятой
        formatter.maximumFractionDigits = 6 // максимум после запятой
        return formatter
    }
    
    /// Конвертируем значение Double в строку со значением валюты с 2-6 знаками после запятой
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Конвертируем значение Double в строковый вид
    /// ```
    /// Convert 1.2345 to "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Конвертируем значение Double в строковый вид
    /// ```
    /// Convert 1.2345 to "1.23%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
    
}
