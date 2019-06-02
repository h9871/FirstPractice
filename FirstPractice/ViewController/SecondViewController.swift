//
//  SecondViewController.swift
//  FirstPractice
//
//  Created by 유현재 on 21/04/2019.
//  Copyright © 2019 유현재. All rights reserved.
//

import UIKit


enum MoveFlg {
    case modal
    case push
}

class SecondViewController: UIViewController {
    
    /// MARK - IBOutlet Properties

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    /// MARK - Properties
    
    // View FLAG
    var moveFlg: MoveFlg = .push
    
    // static Properties
    static var pushWidth: Int = 0
    static var pushHeight: Int = 0
    
    // Make View
    var viewWidth: Int = 0
    var viewHeight: Int = 0
    
    /// MARK - Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch moveFlg {
        case .modal:
            self.makeView(viewWidth, viewHeight)
        case .push:
            self.makeView(SecondViewController.pushWidth, SecondViewController.pushHeight)
        }
    }
    
    @IBAction func didTappedBackButton(_ sender: Any) {
        switch moveFlg {
        case .modal:
            self.dismiss(animated: true, completion: nil)
        case .push:
            self.navigationController?.popViewController(animated: true)
        }
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTappedSaveButton(_ sender: Any) {
        switch moveFlg {
        case .modal:
            UserDefaultUtil.setViewWidthFrame(saveWidth: viewWidth)
            UserDefaultUtil.setViewWidthFrame(saveHeight: viewHeight)
        case .push:
            UserDefaultUtil.setViewWidthFrame(saveWidth: SecondViewController.pushWidth)
            UserDefaultUtil.setViewWidthFrame(saveHeight: SecondViewController.pushHeight)
        }
    }
}

extension SecondViewController {
    private func makeView(_ width: Int, _ height: Int) {
        let makeView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        makeView.backgroundColor = UIColor.black
        makeView.center = self.view.center
        view.addSubview(makeView)
    }
}
