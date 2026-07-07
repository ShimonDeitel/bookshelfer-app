import SwiftUI

/// Bespoke palette for Bookshelfer -- Inventory your physical book collection by shelf location.
enum Theme {
    static let accent = Color(hex: "#7A4FB5")
    static let background = Color(hex: "#160F1E")
    static let backgroundSecondary = Color(hex: "#1F1528")
    static let card = Color(hex: "#271A31")
    static let textPrimary = Color(hex: "#F1EAF7")
    static let textSecondary = Color(hex: "#C7ACDE")

    static var titleFont: Font { Font.system(.title2, design: .serif).weight(.semibold) }
    static var bodyFont: Font { Font.system(.body, design: .serif) }
    static var captionFont: Font { Font.system(.caption, design: .serif) }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet(charactersIn: "#")))
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb & 0xFF0000) >> 16) / 255.0
        let g = Double((rgb & 0x00FF00) >> 8) / 255.0
        let b = Double(rgb & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b)
    }
}
