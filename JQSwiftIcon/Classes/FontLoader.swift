//
//  FontLoader.swift
//  SwiftIconFont
//
//  Created by Sedat Ciftci on 18/03/16. Tweaked by Jose Quintero on 08/06/2016
//  Copyright © 2016 Sedat Gokbek Ciftci. All rights reserved.
//

import UIKit
import CoreText

class FontLoader: NSObject {
    class func loadFont(_ fontName: String) {
        let mainBundleURL: Bundle = Bundle(for: FontLoader.self)
        let subBundleURL = mainBundleURL.url(forResource: "JQSwiftIcon", withExtension: "bundle")
        let bundle = Bundle(url: subBundleURL!)!
        var fontURL: URL = URL(fileURLWithPath: "")
        for name : String in bundle.paths(forResourcesOfType: "ttf", inDirectory: nil) {
            if name.lowercased().range(of: fontName) != nil {
                fontURL = URL(fileURLWithPath: name)
            }
        }

        let data = try! Data(contentsOf: fontURL)
        let provider = CGDataProvider(data: data as CFData)
        let font = CGFont(provider!)

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }
}
