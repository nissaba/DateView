//
//  TwoLineDateView.swift
//  TwoLineDate
//
//  Created by Pascale Beaulac on 2014-10-12.
//  Copyright (c) 2014 Pascale Beaulac. All rights reserved.
//

import UIKit


@available(iOS 9.0, *)
class TwoLineDateView: LiveNibView {
    @IBOutlet weak var lblMonth: UILabel!
    @IBOutlet weak var lblMonthDay: UILabel!
    @IBOutlet weak var labelView: UIView!
    
    //MARK: labels

    @IBInspectable var month: String = ""{
        didSet{
            updateMonth()
        }
    }
    
    @IBInspectable var dayOfMonth:Int8 = 1{
        didSet{
            self.proxyView().lblMonthDay.text = String(format:"%02d", dayOfMonth)
            self.lblMonthDay.text = String(format:"%02d", dayOfMonth)
        }
    }
    
    @IBInspectable var upperCasse: Bool = false{
        didSet{
            updateMonth()
        }
    }
    
    @IBInspectable var fontSize:CGFloat = 17.0{
        didSet{
            updateFont()
        }
    }
    
    @IBInspectable var fontBold: Bool = false{
        didSet{
            updateFont()
        }
    }
    
    @IBInspectable var fontColor:UIColor = UIColor.black{
        didSet{
            self.proxyView().lblMonth.textColor = fontColor
            self.proxyView().lblMonthDay.textColor = fontColor
            self.lblMonth.textColor = fontColor
            self.lblMonthDay.textColor = fontColor

        }
    }
    
    //MARK: Borders
    @IBInspectable internal var borderWidht: CGFloat = 0.0
        {
        didSet{
            layer.borderWidth = borderWidht
        }
    }
    
    @IBInspectable internal var borderColor: UIColor?
        {
        didSet{
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable internal var cornerRadius: CGFloat = 0.0{
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    private func updateFont(){
        if fontBold{
            self.proxyView().lblMonthDay.font = UIFont.boldSystemFont(ofSize: fontSize)
            self.proxyView().lblMonth.font = UIFont.boldSystemFont(ofSize: fontSize-10.0)
            self.lblMonthDay.font = UIFont.boldSystemFont(ofSize: fontSize)
            self.lblMonth.font = UIFont.boldSystemFont(ofSize: fontSize-10.0)
        }else
        {
            self.proxyView().lblMonthDay.font = UIFont.systemFont(ofSize: fontSize)
            self.proxyView().lblMonth.font = UIFont.systemFont(ofSize: fontSize-10.0)
            self.lblMonthDay.font = UIFont.systemFont(ofSize: fontSize)
            self.lblMonth.font = UIFont.systemFont(ofSize: fontSize-10.0)
        }
    }
    
    @available(iOS 9.0, *)
    private func updateMonth(){
        if(upperCasse){
            self.proxyView().lblMonth.text = month.localizedUppercase
            self.lblMonth.text = month.localizedUppercase
        }else{
            self.proxyView().lblMonth.text = month
            self.lblMonth.text = month
        }
    }
    
    override func nibName() -> String {
        return "TwoLineDateView"
    }
    
    private func proxyView() -> TwoLineDateView {
        return self.proxyView! as! TwoLineDateView
    }

   
}
