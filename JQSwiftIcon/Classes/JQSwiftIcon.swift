//
//  JQSwiftIcon.swift
//
//  Created by Jose Quintero on 8/6/2016 and tweaked by Roman Zhyliov on 08/08/2016.
//  Copyright © 2016 Jose Quintero. All rights reserved.
//

import UIKit

let FontNames = [
    "fontawesome"               : "FontAwesome"
    , "open-iconic"             : "Icons"
    , "ionicons"                : "Ionicons"
    , "octicons"                : "octicons"
    , "eleganticons"            : "ElegantIcons"
    , "themify"                 : "themify"
    , "map-icons"               : "map-icons"
    , "pe-icon-7-stroke"        : "Pe-icon-7-stroke"
    , "materialicons-regular"   : "Material Icons"
]

public enum FontsFileNames: String {
    case FontAwesome  = "fontawesome"
    , Iconic       = "open-iconic"
    , Ionicon      = "ionicons"
    , Octicon      = "octicons"
    , ElegantIcons = "eleganticons"
    , Themify      = "themify"
    , MapIcons     = "map-icons"
    , Stroke7      = "pe-icon-7-stroke"
    , Material     = "materialicons-regular"
}

func processFont(_ fontSize: CGFloat?, fontFileName: FontsFileNames, attributedString: NSMutableAttributedString, matchedStringArray: [String], substring: String!) {

    let substringRange = NSMakeRange(0, substring.characters.count);
    attributedString.replaceCharacters(in: substringRange, with: String.iconWithCode(fontFileName, code: matchedStringArray[1])!)
    let newRange = _NSRange(location: substringRange.location, length: 1)
    attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(fontFileName, fontSize: (fontSize)!), range: newRange)
}

func processFontPrefixes(_ fontSize: CGFloat?, attributedString: NSMutableAttributedString, matchedStringArray: [String], substring: String!) {
    if let _ = fontAwesomeIconArr[matchedStringArray[1]] , matchedStringArray[0].lowercased() == "fa"{
        processFont(fontSize, fontFileName: FontsFileNames.FontAwesome, attributedString: attributedString, matchedStringArray: matchedStringArray, substring: substring);
    }
    if let _ = ioniconArr[matchedStringArray[1]] , matchedStringArray[0].lowercased() == "ii"{
        processFont(fontSize, fontFileName: FontsFileNames.Ionicon, attributedString: attributedString, matchedStringArray: matchedStringArray, substring: substring);
    }
    if let _ = octiconArr[matchedStringArray[1]] , matchedStringArray[0].lowercased() == "oi"{
        processFont(fontSize, fontFileName: FontsFileNames.Octicon, attributedString: attributedString, matchedStringArray: matchedStringArray, substring: substring);
    }
    if let _ = iconicIconArr[matchedStringArray[1]] , matchedStringArray[0].lowercased() == "inic"{
        processFont(fontSize, fontFileName: FontsFileNames.Iconic, attributedString: attributedString, matchedStringArray: matchedStringArray, substring: substring);
    }
    if let _ = elegantIconArr[matchedStringArray[1]] , matchedStringArray[0].lowercased() == "el"{
        processFont(fontSize, fontFileName: FontsFileNames.ElegantIcons, attributedString: attributedString, matchedStringArray: matchedStringArray, substring: substring);
    }
    if let _ = themifyIconArr[matchedStringArray[1]] , matchedStringArray[0].lowercased() == "th"{
        processFont(fontSize, fontFileName: FontsFileNames.Themify, attributedString: attributedString, matchedStringArray: matchedStringArray, substring: substring);
    }
    if let _ = mapIconsArr[matchedStringArray[1]] , matchedStringArray[0].lowercased() == "mp"{
        processFont(fontSize, fontFileName: FontsFileNames.MapIcons, attributedString: attributedString, matchedStringArray: matchedStringArray, substring: substring);
    }
    if let _ = stroke7Arr[matchedStringArray[1]] , matchedStringArray[0].lowercased() == "pe"{
        processFont(fontSize, fontFileName: FontsFileNames.Stroke7, attributedString: attributedString, matchedStringArray: matchedStringArray, substring: substring);
    }
    if let _ = materialIconArr[matchedStringArray[1]] , matchedStringArray[0].lowercased() == "mat"{
        processFont(fontSize, fontFileName: FontsFileNames.Material, attributedString: attributedString, matchedStringArray: matchedStringArray, substring: substring);
    }
}

func processTextIcons(
    _ textToCheck: NSString,
    pointSize: CGFloat,
    attributedStringToCheck: NSAttributedString,
    setTextCallback: (NSAttributedString) -> Void) {

    let text = textToCheck;
    let textRange = NSMakeRange(0, text.length)
    let attributedString = NSMutableAttributedString(string: textToCheck as String)

    let subStr = textToCheck.substring(with: textRange);
    var s = ["", ""];
    s = subStr.characters.split{$0 == ":"}.map(String.init)
    if s.count == 1{
        return
    }
    processFontPrefixes(pointSize, attributedString: attributedString, matchedStringArray: s, substring: subStr)


    //when the view is about to be released -> overassignment mightn happen
    //which will cause visual font issue
    if (attributedStringToCheck.string != attributedString.string) {
        setTextCallback(attributedString);
    }
}


public struct FontArr {
    static func getFontArr(_ fromFont: FontsFileNames) -> [String: String]{
        if fromFont == .FontAwesome{
            return fontAwesomeIconArr
        }else if fromFont == .Iconic {
            return iconicIconArr
        }else if fromFont == .Ionicon {
            return ioniconArr
        }else if fromFont == .Octicon{
            return octiconArr
        }else if fromFont == .ElegantIcons{
            return elegantIconArr
        }else if fromFont == .Themify{
            return themifyIconArr
        }else if fromFont == .MapIcons{
            return mapIconsArr
        }else if fromFont == .Stroke7{
            return stroke7Arr
        }else{
            return materialIconArr
        }
    }
}

public extension UILabel {
    func processIcons() {
        processTextIcons(self.text! as NSString, pointSize: self.font!.pointSize, attributedStringToCheck: self.attributedText!, setTextCallback: {(attributedString: NSAttributedString) in
            self.attributedText = attributedString
            })
    }

    func setTextWithIconFont(_ font: FontsFileNames, size: CGFloat = 15.0, text: String){
        self.font = UIFont.iconFontOfSize(font, fontSize: size)
        self.text = text
    }
}

public extension UITextField{
    func processIcons() {
        processTextIcons(self.text! as NSString, pointSize: self.font!.pointSize, attributedStringToCheck: self.attributedText!, setTextCallback: {(attributedString: NSAttributedString) in
            self.attributedText = attributedString
        })
    }

    func setTextWithIconFont(_ font: FontsFileNames, size: CGFloat = 15.0, text: String){
        self.font = UIFont.iconFontOfSize(font, fontSize: size)
        self.text = text
    }
}

public extension UIButton {
    func processIcons() {
        processTextIcons((self.titleLabel?.text)! as NSString, pointSize: (self.titleLabel?.font!.pointSize)!, attributedStringToCheck: (self.titleLabel?.attributedText)!, setTextCallback: {(attributedString: NSAttributedString) in
            self.setAttributedTitle(attributedString, for: UIControlState())
        })
    }

    func setTextWithIconFont(_ font: FontsFileNames, size: CGFloat = 15.0, text: String){
        self.titleLabel?.font = UIFont.iconFontOfSize(font, fontSize: size)
        self.titleLabel?.text = text
    }
}

public extension UIFont{
    static func iconFontOfSize(_ font: FontsFileNames, fontSize: CGFloat) -> UIFont {
        let fontFileName = font.rawValue
        let fontName = FontNames[fontFileName]
        if (UIFont.fontNames(forFamilyName: fontName!).count == 0) {
            FontLoader.loadFont(fontFileName.lowercased())
        }
        return UIFont(name: fontName!, size: fontSize)!
    }
}

public extension String {
    public static func iconWithCode(_ font: FontsFileNames, code: String) -> String? {
        if let icon = FontArr.getFontArr(font)[code] {
            return icon
        }
        return nil
    }
}
