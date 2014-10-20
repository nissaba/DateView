//
//  DateView.swift
//  TwoLineDate
//
//  Created by Pascale Beaulac on 2014-10-18.
//  Copyright (c) 2014 Pascale Beaulac. All rights reserved.
//

import UIKit
import QuartzCore
import Foundation

@IBDesignable class DateView: UIView {
    
    private var pFont:UIFont? = nil
    //var viewWidth:[AnyObject]?
    //var viewHeight:[AnyObject]?
    var date:NSDate = NSDate.date(){didSet{setNeedsDisplay()}}
    @IBInspectable var dateCapitalized:Bool = false {didSet{setNeedsDisplay()}}
    @IBInspectable var dateFormat:String = "dd/MMM/yyyy" {didSet{setNeedsDisplay()}}
    @IBInspectable var dateSeparator:String = " " {didSet{setNeedsDisplay()}}
    @IBInspectable var fontName:String = "Helvetica Bold" {didSet{setFontByName();setNeedsDisplay()}}
    @IBInspectable var fontSize:CGFloat = 14.0 {didSet{setFontBySize();setNeedsDisplay()}}
    @IBInspectable internal var fontColor:UIColor = UIColor.blackColor(){didSet{setNeedsDisplay()}}
    @IBInspectable internal var borderWidth:CGFloat = 0 {didSet{layer.borderWidth = borderWidth; setNeedsDisplay()}}
    @IBInspectable internal var borderColor:UIColor? {didSet{layer.borderColor = borderColor?.CGColor; setNeedsDisplay()}}
    @IBInspectable internal var cornerRadius: CGFloat = 0.0 {didSet{layer.cornerRadius = cornerRadius; setNeedsDisplay()}}
    @IBInspectable var displayVetical:Bool = false {didSet{setNeedsDisplay()}}
    var font:UIFont? {didSet{setFontByUIFont();setNeedsDisplay()}}
    
    
    private func setFontByUIFont(){
        pFont = font
    }
    
    private func setFontBySize(){
        if let name = pFont?.fontName {
            pFont = UIFont(name: name, size: fontSize)
        }else{
            pFont = UIFont(name: fontName, size: fontSize)
        }
    }
    
    private func setFontByName(){
        pFont = UIFont(name: fontName, size: fontSize)
    }
    
    override func drawRect(rect: CGRect)
    {
        
        let formater = NSDateFormatter()
        formater.dateStyle = NSDateFormatterStyle.ShortStyle

        formater.dateFormat = dateFormat
        var dateString = formater.stringFromDate(date)
        if dateCapitalized{
            dateString = dateString.uppercaseString
        }
        
        var yOffset:CGFloat = 0.0
        let paraStyle = NSMutableParagraphStyle()
        if displayVetical {
            dateString = dateString.stringByReplacingOccurrencesOfString(dateSeparator, withString: "\n")
            yOffset = 3.0
            paraStyle.maximumLineHeight = fontSize - 3
            paraStyle.lineSpacing = 0.0
        }

        if font == nil{
            setFontByName()
        }
        
        paraStyle.alignment = NSTextAlignment.Center
        let textFontAttributes = [
            NSFontAttributeName: pFont!,
            NSParagraphStyleAttributeName:paraStyle,
            NSForegroundColorAttributeName: fontColor
        ]
        var dateFormatedString = NSAttributedString(string: dateString, attributes:textFontAttributes)
        let neededSize = dateFormatedString.size()
        let x = (rect.size.width - neededSize.width)/2
        let y = yOffset+(rect.size.height - neededSize.height)/2
        let stringRect = CGRect(x: x, y: y, width: neededSize.width, height: neededSize.height)
        dateFormatedString.drawInRect(stringRect)
    }
    
    
}
