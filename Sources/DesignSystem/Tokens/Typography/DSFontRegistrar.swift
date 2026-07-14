//
//  DSFontRegistrar.swift
//  DesignSystem
//
//  Created by Ofir Elias on 14/07/2026.
//

import CoreText

enum DSFontRegistrar {
    static func registerFonts() {
        for name in ["SF-Pro-Text-Regular", "SF-Pro-Text-Semibold"] {
            guard let url = Bundle.module.url(forResource: name, withExtension: "otf") else { continue }
            CTFontManagerRegisterFontsForURL(url as CFURL, .process, nil)
        }
    }
}
