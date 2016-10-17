//
//  DesignableView.swift
//  DesignableView
//
//  Created by Art on 18/10/2016.
//
//

import UIKit

@IBDesignable
public class DesignableView: UIView, DesignableXib {
    init() {
        super.init(frame: CGRect.zero)
        
        xibSetup()
        commonSetup()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        xibSetup()
        commonSetup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        xibSetup()
        commonSetup()
    }
    
    init(xibName: String) {
        super.init(frame: CGRect.zero)
        xibSetup(name: xibName)
        commonSetup()
    }
    
    func commonSetup() {
        // for override in subclass
    }
}

public protocol DesignableXib {
    func xibSetup(name:String?)
}
public extension DesignableXib where Self: UIView {
    
    func xibSetup(name:String? = nil) {
        
        let nibName = name ?? type(of: self).description().components(separatedBy: ".").last!
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        
        guard let view = nib.instantiate(withOwner: self, options: nil)[0] as? UIView  else { return }
        addSubviewInCenter(view: view)
    }
}


public extension UIView {
    
    public func addSubviewInCenter(view:UIView, top:CGFloat = 0, left:CGFloat = 0, bottom:CGFloat = 0, right:CGFloat = 0) {
        addSubview(view)
        
        let bindings = ["view": view]
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-left-[view]-right-|", options:[], metrics:["left":left, "right":right], views: bindings))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-top-[view]-bottom-|", options:[], metrics:["top":top, "bottom":bottom], views: bindings))
        let centerX = NSLayoutConstraint(item: view, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0)
        let centerY = NSLayoutConstraint(item: view, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        
        centerX.isActive = true
        centerY.isActive = true
    }
}
