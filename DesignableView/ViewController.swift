//
//  ViewController.swift
//  DesignableView
//
//  Created by Art on 18/10/2016.
//
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customView: CustomView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        customView.buttonAction = {
            print("buttonTouchUpInside")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

