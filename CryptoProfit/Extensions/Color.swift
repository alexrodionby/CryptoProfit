//
//  Color.swift
//  CryptoProfit
//
//  Created by Alexandr Rodionov on 28.08.22.
//

import Foundation
import SwiftUI

// MARK: Делаем дополнение к цвету в виде константы со структурой цветов. Позже легко менять весь набор цветовой путем добавления схемы.

extension Color {
    static let theme = ColorTheme()
}

// MARK: Структура для сохранения всех цветов. Берем из Assets.

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("GreenColor")
    let red = Color("RedColor")
    let icon = Color("IconColor")
    let secondaryText = Color("SecondaryTextColor")
}
