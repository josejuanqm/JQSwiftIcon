//
//  JQSwiftIcon.swift
//
//  Created by Jose Quintero on 8/6/2016.
//  Copyright © 2016 Jose Quintero. All rights reserved.
//

import UIKit

public enum Fonts: String {
    case FontAwesome  = "FontAwesome"
       , Iconic       = "Icons"
       , Ionicon      = "Ionicons"
       , Octicon      = "open-ionic"
       , ElegantIcons = "ElegantIcons"
       , Themify      = "Themify"
       , MapIcons     = "Map-Icons"
       , Stroke7      = "Pe-icon-7-stroke"
       , Material     = "MaterialIcons-Regular"
}

public struct FontArr {
    static func getFontArr(fromFont: Fonts) -> [String: String]{
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

public extension UILabel{
    func processIcons() {
        let text = self.text! as NSString
        let textRange = NSMakeRange(0, text.length)
        let attributedString = NSMutableAttributedString(string: self.text!)
        
        text.enumerateSubstringsInRange(textRange, options: .ByWords, usingBlock: {
            (substring, substringRange, _, _) in
            var s = ["", ""]
            s = substring!.characters.split{$0 == ":"}.map(String.init)
            if s.count == 1{
                return
            }
            if let _ = fontAwesomeIconArr[s[1]] {
                if s[0].lowercaseString != "fa"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.FontAwesome, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.FontAwesome, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = ioniconArr[s[1]] {
                if s[0].lowercaseString != "ii"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Ionicon, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Ionicon, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = octiconArr[s[1]] {
                if s[0].lowercaseString != "oi"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Octicon, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Octicon, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = iconicIconArr[s[1]] {
                if s[0].lowercaseString != "inic"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Iconic, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Iconic, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = elegantIconArr[s[1]] {
                if s[0].lowercaseString != "el"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.ElegantIcons, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.ElegantIcons, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = themifyIconArr[s[1]] {
                if s[0].lowercaseString != "th"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Themify, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Themify, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = mapIconsArr[s[1]] {
                if s[0].lowercaseString != "mp"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.MapIcons, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.MapIcons, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = stroke7Arr[s[1]] {
                if s[0].lowercaseString != "pe"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Stroke7, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Stroke7, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = materialIconArr[s[1]] {
                if s[0].lowercaseString != "mat"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Material, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Material, fontSize: self.font!.pointSize), range: newRange)
            }
        })
        
        self.attributedText = attributedString
    }
    
    func setTextWithIconFont(font: Fonts, size: CGFloat = 15.0, text: String){
        self.font = UIFont.iconFontOfSize(font, fontSize: size)
        self.text = text
    }
}

public extension UITextField{
    func processIcons() {
        let text = self.text! as NSString
        let textRange = NSMakeRange(0, text.length)
        let attributedString = NSMutableAttributedString(string: self.text!)
        
        text.enumerateSubstringsInRange(textRange, options: .ByWords, usingBlock: {
            (substring, substringRange, _, _) in
            var s = ["", ""]
            s = substring!.characters.split{$0 == ":"}.map(String.init)
            if s.count == 1{
                return
            }
            if let _ = fontAwesomeIconArr[s[1]] {
                if s[0].lowercaseString != "fa"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.FontAwesome, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.FontAwesome, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = ioniconArr[s[1]] {
                if s[0].lowercaseString != "ii"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Ionicon, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Ionicon, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = octiconArr[s[1]] {
                if s[0].lowercaseString != "oi"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Octicon, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Octicon, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = iconicIconArr[s[1]] {
                if s[0].lowercaseString != "inic"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Iconic, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Iconic, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = elegantIconArr[s[1]] {
                if s[0].lowercaseString != "el"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.ElegantIcons, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.ElegantIcons, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = themifyIconArr[s[1]] {
                if s[0].lowercaseString != "th"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Themify, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Themify, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = mapIconsArr[s[1]] {
                if s[0].lowercaseString != "mp"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.MapIcons, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.MapIcons, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = stroke7Arr[s[1]] {
                if s[0].lowercaseString != "pe"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Stroke7, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Stroke7, fontSize: self.font!.pointSize), range: newRange)
            }
            if let _ = materialIconArr[s[1]] {
                if s[0].lowercaseString != "mat"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Material, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Material, fontSize: self.font!.pointSize), range: newRange)
            }
        })
        
        self.attributedText = attributedString
    }
    
    func setTextWithIconFont(font: Fonts, size: CGFloat = 15.0, text: String){
        self.font = UIFont.iconFontOfSize(font, fontSize: size)
        self.text = text
    }
}

public extension UIButton{
    func processIcons() {
        let text = (self.titleLabel?.text)! as NSString
        let textRange = NSMakeRange(0, text.length)
        let attributedString = NSMutableAttributedString(string: (self.titleLabel?.text)!)
        
        text.enumerateSubstringsInRange(textRange, options: .ByWords, usingBlock: {
            (substring, substringRange, _, _) in
            var s = ["", ""]
            s = substring!.characters.split{$0 == ":"}.map(String.init)
            if s.count == 1{
                return
            }
            if let _ = fontAwesomeIconArr[s[1]] {
                if s[0].lowercaseString != "fa"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.FontAwesome, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.FontAwesome, fontSize: (self.titleLabel?.font!.pointSize)!), range: newRange)
            }
            if let _ = ioniconArr[s[1]] {
                if s[0].lowercaseString != "ii"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Ionicon, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Ionicon, fontSize: (self.titleLabel?.font!.pointSize)!), range: newRange)
            }
            if let _ = octiconArr[s[1]] {
                if s[0].lowercaseString != "oi"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Octicon, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Octicon, fontSize: (self.titleLabel?.font!.pointSize)!), range: newRange)
            }
            if let _ = iconicIconArr[s[1]] {
                if s[0].lowercaseString != "inic"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Iconic, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Iconic, fontSize: (self.titleLabel?.font!.pointSize)!), range: newRange)
            }
            if let _ = elegantIconArr[s[1]] {
                if s[0].lowercaseString != "el"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.ElegantIcons, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.ElegantIcons, fontSize: (self.titleLabel?.font!.pointSize)!), range: newRange)
            }
            if let _ = themifyIconArr[s[1]] {
                if s[0].lowercaseString != "th"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Themify, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Themify, fontSize: (self.titleLabel?.font!.pointSize)!), range: newRange)
            }
            if let _ = mapIconsArr[s[1]] {
                if s[0].lowercaseString != "mp"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.MapIcons, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.MapIcons, fontSize: (self.titleLabel?.font!.pointSize)!), range: newRange)
            }
            if let _ = stroke7Arr[s[1]] {
                if s[0].lowercaseString != "pe"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Stroke7, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Stroke7, fontSize: (self.titleLabel?.font!.pointSize)!), range: newRange)
            }
            if let _ = materialIconArr[s[1]] {
                if s[0].lowercaseString != "mat"{
                    return
                }
                attributedString.replaceCharactersInRange(substringRange, withString: String.iconWithCode(Fonts.Material, code: s[1])!)
                let newRange = _NSRange(location: substringRange.location, length: 1)
                attributedString.addAttribute(NSFontAttributeName, value: UIFont.iconFontOfSize(Fonts.Material, fontSize: (self.titleLabel?.font!.pointSize)!), range: newRange)
            }
        })
        
        self.setAttributedTitle(attributedString, forState: .Normal)
    }
    
    func setTextWithIconFont(font: Fonts, size: CGFloat = 15.0, text: String){
        self.titleLabel?.font = UIFont.iconFontOfSize(font, fontSize: size)
        self.titleLabel?.text = text
    }
}

public extension UIFont{
    static func iconFontOfSize(font: Fonts, fontSize: CGFloat) -> UIFont {
        let fontName = font.rawValue
        var token: dispatch_once_t = 0
        if (UIFont.fontNamesForFamilyName(fontName).count == 0) {
            dispatch_once(&token) {
                FontLoader.loadFont(fontName.lowercaseString)
            }
        }
        return UIFont(name: fontName, size: fontSize)!
    }
}

public extension String {
    public static func iconWithCode(font: Fonts, code: String) -> String? {
        if let icon = FontArr.getFontArr(font)[code] {
            return icon
        }
        return nil
    }
}