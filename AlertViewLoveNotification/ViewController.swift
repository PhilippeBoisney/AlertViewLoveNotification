//
//  ViewController.swift
//  AlertViewLoveNotification
//
//  Created by Philippe on 07/10/2016.
//  Copyright © 2016 CookMinute. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alertView: AlertViewLoveNotification!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alertView = AlertViewLoveNotification(imageName: "iconNotification", labelTitle: "ENABLE PUSH NOTIFICATIONS", labelDescription: "Would you like to be alerted about us, at any moment, even when you're sleeping ? Because we miss you... Always.", buttonYESTitle: "Yes, Of course !", buttonNOTitle: "No, sorry..")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onTouch(_ sender: AnyObject) {
        self.alertView.show()
    }
    func configureAnOtherDesign(){
        
        ///Height of each view (Total of this height MUST be equal to 1)
        self.alertView.heightOfButtonYes = 0.1
        self.alertView.heightOfButtonNo = 0.1
        self.alertView.heightSpaceBetweenViews = 0.05 ///There is 4 spaces
        self.alertView.heightOfContenerForImage = 0.35
        self.alertView.heightOfTitle = 0.1
        self.alertView.heightOfDescription = 0.15
        
        ///Width of each view
        self.alertView.widthOfImage = 0.9
        self.alertView.widthOfTitle = 0.7
        self.alertView.widthOfDescription = 0.9
        self.alertView.widthForButtons = 0.8
        
        self.alertView.heightOfImage = 0.7
        
        ///Colors of views
        self.alertView.colorLabelTitle = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        self.alertView.colorLabelDescription = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
        
        self.alertView.colorBackgroundAlertView = UIColor.red
        
        self.alertView.colorBacgroundButtonYes = UIColor(red:0.96, green:0.56, blue:0.46, alpha:1.0)
        self.alertView.colorTextColorButtonYes = UIColor.white
        
        self.alertView.colorBacgroundButtonNO = UIColor.clear
        self.alertView.colorTextColorButtonNO = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
    }
}
