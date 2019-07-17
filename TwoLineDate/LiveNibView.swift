//
//  LiveRenderedNibView.swift
//  Xcode Live Rendering
//
//  Created by Morten Bøgh on 29/07/14.
//  Copyright (c) 2014 Morten Bøgh. All rights reserved.
//

import UIKit

@IBDesignable
public class LiveNibView: UIView {
    public weak var proxyView: LiveNibView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        let view = self.loadNib()
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.proxyView = view
        
        if let view = proxyView {
            self.addSubview(view)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func awakeAfterUsingCoder(aDecoder: NSCoder!) -> AnyObject! {
        if self.subviews.count == 0 {
            let view = self.loadNib()
            view.translatesAutoresizingMaskIntoConstraints = false
            let contraints = self.constraints
            self.removeConstraints(contraints)
            view.addConstraints(contraints)
            view.proxyView = view
            return view
        }
        return self
    }

    private func loadNib() -> LiveNibView {
        let bundle = Bundle(for: type(of: self))
        return bundle.loadNibNamed(self.nibName(), owner: nil, options: nil)![0] as! LiveNibView
    }
    
    public func nibName() -> String {
        return ""
    }
}
