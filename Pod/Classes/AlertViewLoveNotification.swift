//
//  AlertViewLoveNotification.swift
//  AlertViewLoveNotification
//
//  Created by Philippe on 07/10/2016.
//  Copyright © 2016 CookMinute. All rights reserved.
//

//
//  AlertOnboarding.swift
//  AlertOnboarding
//
//  Created by Philippe Boisney on 23/06/2016.
//  Copyright © 2016 Philippe Boisney. All rights reserved.
//


import UIKit
import UserNotifications

public class AlertViewLoveNotification: UIView {
    
    //FOR DATA  ------------------------
    private var imageName: String!
    private var labelTitleText: String!
    private var labelDescriptionText: String!
    private var buttonYESText: String!
    private var buttonNOText: String!
    private var labelTitleSize: CGFloat = 15
    private var labelDescriptionSize: CGFloat = 10
    private var labelButtonSize: CGFloat = 13
    
    //FOR DESIGN    ------------------------
    private var buttonYES: UIButton!
    private var buttonNO: UIButton!
    private var labelTitle: UILabel!
    private var labelDescription: UILabel!
    private var imageView: UIImageView!
    
    //FOR (BETTER) DESIGN ------------------
    private var topSpace: UIView!
    private var labelsSpace: UIView!
    private var imageLabelSpace: UIView!
    private var imageButtonSpace: UIView!
    private var layerBlack: UIView!
    private var contenerForImage: UIView!
    
    // PUBLIC VARS --------------------------------------------------
    
    ///Height of each view (Total of this height MUST be equal to 1)
    public var heightOfButtonYes: CGFloat = 0.1
    public var heightOfButtonNo: CGFloat = 0.1
    public var heightSpaceBetweenViews: CGFloat = 0.05 ///There is 4 spaces
    public var heightOfContenerForImage: CGFloat = 0.35
    public var heightOfTitle: CGFloat = 0.1
    public var heightOfDescription: CGFloat = 0.15
    
    ///Width of each view
    public var widthOfImage: CGFloat = 0.9
    public var widthOfTitle: CGFloat = 0.7
    public var widthOfDescription: CGFloat = 0.9
    public var widthForButtons: CGFloat = 0.8
    
    public var heightOfImage: CGFloat = 0.7
    
    ///Colors of views
    public var colorLabelTitle = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
    public var colorLabelDescription = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
    
    public var colorBackgroundAlertView = UIColor(red:0.87, green:0.93, blue:0.95, alpha:1.0)
    
    public var colorBacgroundButtonYes = UIColor(red:0.96, green:0.56, blue:0.46, alpha:1.0)
    public var colorTextColorButtonYes = UIColor.white
    
    public var colorBacgroundButtonNO = UIColor.clear
    public var colorTextColorButtonNO = UIColor(red:0.29, green:0.29, blue:0.29, alpha:1.0)
    
    // SIZE OF ALERTVIEW  ------------------------------
    private var percentageRatioHeight: CGFloat {
        get {
            if DeviceType.IS_IPAD || DeviceType.IS_IPAD_PRO {
                return 0.6
            } else {
                return 0.8
            }
        }
    }
    
    private var percentageRatioWidth: CGFloat {
        get {
            if DeviceType.IS_IPAD || DeviceType.IS_IPAD_PRO {
                return 0.6
            } else {
                return 0.8
            }
        }
    }
    
    //INITIALIZERS
    
    public init (imageName: String, labelTitle: String, labelDescription: String, buttonYESTitle: String, buttonNOTitle: String) {
        super.init(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0)))
        
        self.imageName = imageName
        self.labelTitleText = labelTitle
        self.labelDescriptionText = labelDescription
        self.buttonYESText = buttonYESTitle
        self.buttonNOText = buttonNOTitle
        
        self.checkPhoneSize()
        
        self.configure()
        self.interceptOrientationChange()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //-----------------------------------------------------------------------------------------
    // MARK: PUBLIC FUNCTIONS    --------------------------------------------------------------
    //-----------------------------------------------------------------------------------------
    
    public func show() {
        
        self.configure()
        
        // Only show once
        if self.superview != nil {
            return
        }
        
        // Find current top viewcontroller
        if let topController = getTopViewController() {
            let superView: UIView = topController.view
            
            superView.addSubview(self.layerBlack)
            self.addSubview(self.buttonYES)
            self.addSubview(self.buttonNO)
            self.addSubview(self.labelTitle)
            self.addSubview(self.labelDescription)
            self.addSubview(self.topSpace)
            self.addSubview(self.labelsSpace)
            self.addSubview(self.imageLabelSpace)
            self.addSubview(self.imageButtonSpace)
            self.contenerForImage.addSubview(self.imageView)
            self.addSubview(self.contenerForImage)
            superView.addSubview(self)
            
            self.configureConstraints(superView: topController.view)
            self.animateForOpening()
        }
    }
    
    //Hide onboarding with animation
    public func hide(){
        DispatchQueue.main.async {
            self.animateForEnding()
        }
    }
    
    
    //------------------------------------------------------------------------------------------
    // MARK: PRIVATE FUNCTIONS    --------------------------------------------------------------
    //------------------------------------------------------------------------------------------
    
    
    //MARK: FOR CONFIGURATION    --------------------------------------
    private func configure() {
        
        self.contenerForImage = UIView(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0)))
        
        self.imageView = UIImageView(image: UIImage(named: self.imageName))
        
        self.topSpace = UIView(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0)))
        
        self.imageButtonSpace = UIView(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0)))
        
        self.imageLabelSpace = UIView(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0)))
        
        self.labelsSpace = UIView(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0)))
        
        self.layerBlack = UIView(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0)))
        self.layerBlack.backgroundColor = UIColor.black
        self.layerBlack.alpha = 0.3
        
        self.buttonYES = UIButton(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0)))
        self.buttonYES.setTitle(self.buttonYESText, for: .normal)
        self.buttonYES.setTitleColor(self.colorTextColorButtonYes, for: .normal)
        self.buttonYES.backgroundColor = self.colorBacgroundButtonYes
        self.buttonYES.titleLabel?.font = UIFont(name: "Avenir-Medium", size: self.labelButtonSize)
        
        self.buttonNO = UIButton(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0)))
        self.buttonNO.setTitle(self.buttonNOText, for: .normal)
        self.buttonNO.setTitleColor(self.colorTextColorButtonNO, for: .normal)
        self.buttonNO.backgroundColor = self.colorBacgroundButtonNO
        self.buttonNO.titleLabel?.font = UIFont(name: "Avenir-Light", size: self.labelButtonSize)
        
        self.labelTitle = UILabel(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0)))
        self.labelTitle.textColor = self.colorLabelTitle
        self.labelTitle.font = UIFont(name: "Avenir-Medium", size: self.labelTitleSize)
        self.labelTitle.textAlignment = NSTextAlignment.center
        self.labelTitle.numberOfLines = 10
        
        self.labelDescription = UILabel(frame: CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 0, height: 0)))
        self.labelDescription.font = UIFont(name: "Avenir-Light", size: self.labelDescriptionSize)
        self.labelDescription.textAlignment = NSTextAlignment.center
        self.labelDescription.textColor = self.colorLabelDescription
        self.labelDescription.numberOfLines = 10
        
        self.labelTitle.text = self.labelTitleText
        self.labelDescription.text = self.labelDescriptionText
        
        self.buttonYES.addTarget(self, action: #selector(AlertViewLoveNotification.onClick), for: .touchUpInside)
        self.buttonNO.addTarget(self, action: #selector(AlertViewLoveNotification.hide), for: .touchUpInside)
        
        self.backgroundColor = self.colorBackgroundAlertView
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
    }
    
    // -----------------------------------------------------
    //MARK: FOR CONSTRAINTS --------------------------------
    // -----------------------------------------------------
    
    private func configureConstraints(superView: UIView) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.buttonYES.translatesAutoresizingMaskIntoConstraints = false
        self.buttonNO.translatesAutoresizingMaskIntoConstraints = false
        self.labelTitle.translatesAutoresizingMaskIntoConstraints = false
        self.labelDescription.translatesAutoresizingMaskIntoConstraints = false
        self.topSpace.translatesAutoresizingMaskIntoConstraints = false
        self.layerBlack.translatesAutoresizingMaskIntoConstraints = false
        self.labelsSpace.translatesAutoresizingMaskIntoConstraints = false
        self.labelDescription.translatesAutoresizingMaskIntoConstraints = false
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        self.imageLabelSpace.translatesAutoresizingMaskIntoConstraints = false
        self.imageButtonSpace.translatesAutoresizingMaskIntoConstraints = false
        self.contenerForImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.removeConstraints(self.constraints)
        self.buttonYES.removeConstraints(self.buttonYES.constraints)
        self.buttonNO.removeConstraints(self.buttonNO.constraints)
        self.labelTitle.removeConstraints(self.labelTitle.constraints)
        self.labelDescription.removeConstraints(self.labelDescription.constraints)
        self.topSpace.removeConstraints(self.topSpace.constraints)
        self.labelsSpace.removeConstraints(self.labelsSpace.constraints)
        self.layerBlack.removeConstraints(self.layerBlack.constraints)
        self.labelDescription.removeConstraints(self.labelDescription.constraints)
        self.imageView.removeConstraints(self.imageView.constraints)
        self.imageLabelSpace.removeConstraints(self.imageLabelSpace.constraints)
        self.imageButtonSpace.removeConstraints(self.imageButtonSpace.constraints)
        self.contenerForImage.removeConstraints(self.contenerForImage.constraints)
        
        let heightForAlertView = UIScreen.main.bounds.height*percentageRatioHeight
        let widthForAlertView = UIScreen.main.bounds.width*percentageRatioWidth
        
        let heightForContenerOfImageView = heightForAlertView * self.heightOfContenerForImage
        let widthForContenerOfImageView = widthForAlertView
        
        //Constraints for alertview
        let horizontalContraintsAlertView = NSLayoutConstraint(item: self, attribute: .centerXWithinMargins, relatedBy: .equal, toItem: superView, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let verticalContraintsAlertView = NSLayoutConstraint(item: self, attribute:.centerYWithinMargins, relatedBy: .equal, toItem: superView, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0)
        let heightConstraintForAlertView = NSLayoutConstraint.init(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForAlertView)
        let widthConstraintForAlertView = NSLayoutConstraint.init(item: self, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthForAlertView)
        
        //Constraints for black layer
        let heightConstraintBlackLayer = NSLayoutConstraint.init(item: self.layerBlack, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.height)
        let widthConstraintBlackLayer = NSLayoutConstraint.init(item: self.layerBlack, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: UIScreen.main.bounds.width)
        
        //Constraints for top space
        let verticalContraintsTopSpace = NSLayoutConstraint(item: self.topSpace, attribute:.centerXWithinMargins, relatedBy: .equal, toItem: self, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let widthConstraintTopSpace = NSLayoutConstraint(item: self.topSpace, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthForAlertView)
        let heightConstraintTopSpace = NSLayoutConstraint(item: self.topSpace, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForAlertView*self.heightSpaceBetweenViews)
        let pinContraintsTopTopSpace = NSLayoutConstraint(item: self.topSpace, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0)
        
        //Constraints for label title
        let verticalContraintsLabelTitle = NSLayoutConstraint(item: self.labelTitle, attribute:.centerXWithinMargins, relatedBy: .equal, toItem: self, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let widthConstraintLabelTitle = NSLayoutConstraint(item: self.labelTitle, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthForAlertView*self.widthOfTitle)
        let heightConstraintLabelTitle = NSLayoutConstraint(item: self.labelTitle, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForAlertView*self.heightOfTitle)
        let pinContraintsTopLabelTitle = NSLayoutConstraint(item: self.labelTitle, attribute: .top, relatedBy: .equal, toItem: self.topSpace, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        //Constraints for labelsSpaces
        let verticalContraintsLabelsSpaces = NSLayoutConstraint(item: self.labelsSpace, attribute:.centerXWithinMargins, relatedBy: .equal, toItem: self, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let widthConstraintLabelsSpaces = NSLayoutConstraint(item: self.labelsSpace, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthForAlertView)
        let heightConstraintLabelsSpaces = NSLayoutConstraint(item: self.labelsSpace, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForAlertView*self.heightSpaceBetweenViews)
        let pinContraintsTopLabelsSpaces = NSLayoutConstraint(item: self.labelsSpace, attribute: .top, relatedBy: .equal, toItem: labelTitle, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        
        
        
        //Constraints for labelDescription
        let verticalContraintsLabelDescription = NSLayoutConstraint(item: self.labelDescription, attribute:.centerXWithinMargins, relatedBy: .equal, toItem: self, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let widthConstraintLabelDescription = NSLayoutConstraint(item: self.labelDescription, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthForAlertView*self.widthOfDescription)
        let heightConstraintLabelDescription = NSLayoutConstraint(item: self.labelDescription, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForAlertView*self.heightOfDescription)
        let pinContraintsTopLabelDescription = NSLayoutConstraint(item: self.labelDescription, attribute: .top, relatedBy: .equal, toItem: labelsSpace, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        //Constraints for imageLabelSpace
        let verticalContraintsImageLabelSpace = NSLayoutConstraint(item: self.imageLabelSpace, attribute:.centerXWithinMargins, relatedBy: .equal, toItem: self, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let widthConstraintImageLabelSpace = NSLayoutConstraint(item: self.imageLabelSpace, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthForAlertView)
        let heightConstraintImageLabelSpace = NSLayoutConstraint(item: self.imageLabelSpace, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForAlertView*self.heightSpaceBetweenViews)
        let pinContraintsImageLabelSpace = NSLayoutConstraint(item: self.imageLabelSpace, attribute: .top, relatedBy: .equal, toItem: self.labelDescription, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        //Constraints for contener of imageView
        let verticalContraintsContenerImageView = NSLayoutConstraint(item: self.contenerForImage, attribute:.centerXWithinMargins, relatedBy: .equal, toItem: self, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let widthConstraintContenerImageView = NSLayoutConstraint(item: self.contenerForImage, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthForContenerOfImageView)
        let heightConstraintContenerImageView = NSLayoutConstraint(item: self.contenerForImage, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForContenerOfImageView)
        let pinContraintsContenerImageView = NSLayoutConstraint(item: self.contenerForImage, attribute: .top, relatedBy: .equal, toItem: self.imageLabelSpace, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        //Constraints for imageView
        let verticalContraintsImageView = NSLayoutConstraint(item: self.imageView, attribute:.centerXWithinMargins, relatedBy: .equal, toItem: self.contenerForImage, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let horizontalContraintsImageView = NSLayoutConstraint(item: self.imageView, attribute:.centerYWithinMargins, relatedBy: .equal, toItem: self.contenerForImage, attribute: .centerYWithinMargins, multiplier: 1.0, constant: 0)
        let widthConstraintImageImageView = NSLayoutConstraint(item: self.imageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForContenerOfImageView*self.widthOfImage)
        let heightConstraintImageView = NSLayoutConstraint(item: self.imageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForContenerOfImageView*self.heightOfImage)
        
        //Constraints for imageButtonSpace
        let verticalContraintsImageButtonSpace = NSLayoutConstraint(item: self.imageButtonSpace, attribute:.centerXWithinMargins, relatedBy: .equal, toItem: self, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let widthConstraintImageButtonSpace = NSLayoutConstraint(item: self.imageButtonSpace, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthForAlertView)
        let heightConstraintImageButtonSpace = NSLayoutConstraint(item: self.imageButtonSpace, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForAlertView*self.heightSpaceBetweenViews)
        let pinContraintsImageButtonSpace = NSLayoutConstraint(item: self.imageButtonSpace, attribute: .top, relatedBy: .equal, toItem: self.contenerForImage, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        //Constraints for Button YES
        let verticalContraintsButtonYes = NSLayoutConstraint(item: self.buttonYES, attribute:.centerXWithinMargins, relatedBy: .equal, toItem: self, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let widthConstraintButtonYes = NSLayoutConstraint(item: self.buttonYES, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthForAlertView*self.widthForButtons)
        let heightConstraintButtonYes = NSLayoutConstraint(item: self.buttonYES, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForAlertView*self.heightOfButtonYes)
        let pinContraintsButtonYes = NSLayoutConstraint(item: self.buttonYES, attribute: .top, relatedBy: .equal, toItem: self.imageButtonSpace, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        //Constraints for Button NO
        let verticalContraintsButtonNo = NSLayoutConstraint(item: self.buttonNO, attribute:.centerXWithinMargins, relatedBy: .equal, toItem: self, attribute: .centerXWithinMargins, multiplier: 1.0, constant: 0)
        let widthConstraintButtonNo = NSLayoutConstraint(item: self.buttonNO, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: widthForAlertView*self.widthForButtons)
        let heightConstraintButtonNo = NSLayoutConstraint(item: self.buttonNO, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: heightForAlertView*self.heightOfButtonNo)
        let pinContraintsButtonNo = NSLayoutConstraint(item: self.buttonNO, attribute: .top, relatedBy: .equal, toItem: self.buttonYES, attribute: .bottom, multiplier: 1.0, constant: 0)
        
        
        NSLayoutConstraint.activate(
            [horizontalContraintsAlertView, verticalContraintsAlertView,heightConstraintForAlertView, widthConstraintForAlertView,
             widthConstraintLabelTitle, heightConstraintLabelTitle, pinContraintsTopLabelTitle, verticalContraintsLabelTitle,
             verticalContraintsTopSpace, widthConstraintTopSpace, heightConstraintTopSpace, pinContraintsTopTopSpace,
             heightConstraintBlackLayer, widthConstraintBlackLayer,
             verticalContraintsLabelsSpaces, widthConstraintLabelsSpaces, heightConstraintLabelsSpaces, pinContraintsTopLabelsSpaces,
             verticalContraintsLabelDescription, widthConstraintLabelDescription, pinContraintsTopLabelDescription, heightConstraintLabelDescription,
             verticalContraintsImageLabelSpace, widthConstraintImageLabelSpace, heightConstraintImageLabelSpace, pinContraintsImageLabelSpace,
             verticalContraintsImageView, widthConstraintImageImageView, heightConstraintImageView, horizontalContraintsImageView,
             verticalContraintsImageButtonSpace, widthConstraintImageButtonSpace, heightConstraintImageButtonSpace, pinContraintsImageButtonSpace,
             verticalContraintsButtonYes, widthConstraintButtonYes, heightConstraintButtonYes, pinContraintsButtonYes,
             verticalContraintsButtonNo, widthConstraintButtonNo, heightConstraintButtonNo, pinContraintsButtonNo,
             verticalContraintsContenerImageView, widthConstraintContenerImageView, heightConstraintContenerImageView, pinContraintsContenerImageView])
    }
    
    // -----------------------------------------------------
    //MARK: FOR ANIMATIONS ---------------------------------
    // -----------------------------------------------------
    
    private func animateForOpening(){
        self.alpha = 1.0
        self.transform = CGAffineTransform(scaleX: 0.3, y: 0.3)
        UIView.animate(withDuration: 1, delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: [], animations: {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
    }
    
    private func animateForEnding(){
        UIView.animate(withDuration: 0.2, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
            }, completion: {
                (finished: Bool) -> Void in
                // On main thread
                DispatchQueue.main.async {
                    self.contenerForImage.removeFromSuperview()
                    self.removeFromSuperview()
                    self.layerBlack.removeFromSuperview()
                    self.buttonYES.removeFromSuperview()
                    self.buttonNO.removeFromSuperview()
                    self.labelTitle.removeFromSuperview()
                    self.labelDescription.removeFromSuperview()
                    self.topSpace.removeFromSuperview()
                    self.labelsSpace.removeFromSuperview()
                    self.imageLabelSpace.removeFromSuperview()
                    self.imageButtonSpace.removeFromSuperview()
                    self.imageView.removeFromSuperview()
                    self.contenerForImage.removeFromSuperview()
                }
        })
    }
    
    // -----------------------------------------------------
    //MARK: BUTTON ACTIONS ---------------------------------
    // -----------------------------------------------------
    
    func onClick(){
        self.hide()
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert])
        { (granted, error) in
            if granted == true {
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    // --------------------------------------------------------------
    //MARK: NOTIFICATIONS PROCESS -----------------------------------
    // --------------------------------------------------------------
    private func interceptOrientationChange(){
        UIDevice.current.beginGeneratingDeviceOrientationNotifications()
        NotificationCenter.default.addObserver(self, selector: #selector(AlertViewLoveNotification.onOrientationChange), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    func onOrientationChange(){
        if let superview = self.superview {
            self.configureConstraints(superView: superview)
        }
    }
    
    
    // --------------------------------------------------------------
    //MARK: DESIGN PURPOSES ------------------------------------------
    // --------------------------------------------------------------
    private func checkPhoneSize(){
        
        if DeviceType.IS_IPHONE_4_OR_LESS {
            self.labelTitleSize = 14
            self.labelDescriptionSize = 10
            self.labelButtonSize = 10
        } else if DeviceType.IS_IPHONE_5 {
            self.labelTitleSize = 16
            self.labelDescriptionSize = 12
            self.labelButtonSize = 12
        } else if DeviceType.IS_IPHONE_6 {
            self.labelTitleSize = 17
            self.labelDescriptionSize = 13
            self.labelButtonSize = 13
        } else if DeviceType.IS_IPHONE_6P {
            self.labelTitleSize = 20
            self.labelDescriptionSize = 15
            self.labelButtonSize = 13
        } else if DeviceType.IS_IPAD {
            self.labelTitleSize = 22
            self.labelDescriptionSize = 18
            self.labelButtonSize = 18
        } else if DeviceType.IS_IPAD_PRO {
            self.labelTitleSize = 25
            self.labelDescriptionSize = 20
            self.labelButtonSize = 20
        }
    }
    
    enum UIUserInterfaceIdiom : Int
    {
        case Unspecified
        case Phone
        case Pad
    }
    
    struct ScreenSize
    {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS  = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6          = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P         = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD              = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
        static let IS_IPAD_PRO          = UIDevice.current.userInterfaceIdiom == .pad && ScreenSize.SCREEN_MAX_LENGTH == 1366.0
    }
    
    // -----------------------------------------------------
    //MARK: UTILS    ---------------------------------------
    // -----------------------------------------------------
    
    private func getTopViewController() -> UIViewController? {
        var topController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController
        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController
        }
        return topController
    }
}
