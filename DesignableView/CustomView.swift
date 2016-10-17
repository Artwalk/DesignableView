//
//  CustomView.swift
//  DesignableView
//
//  Created by Art on 18/10/2016.
//
//

import UIKit

class CustomView: DesignableView {

    var buttonAction: (()->())?
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func buttonTouchUpInside(_ sender: AnyObject) {
        buttonAction?()
    }
    
}
