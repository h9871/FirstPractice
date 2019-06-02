//
//  ViewController.swift
//  FirstPractice
//
//  Created by 유현재 on 21/04/2019.
//  Copyright © 2019 유현재. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initView()
    }
    
    private func initView() {
        let button = self.view.viewWithTag(10) as? UIButton
        button?.addTarget(self, action: #selector(codeMove(_:)), for: .touchUpInside)
        
        self.widthTextField.delegate = self
        self.heightTextField.delegate = self
        
        dataViewLabel()
    }
    
    private func dataViewLabel() {
        let label = self.view.viewWithTag(1) as? UILabel
        if  UserDefaultUtil.getWidthFrame() != 0,
            UserDefaultUtil.getHeightFrame() != 0 {
            label?.text = "Width: \(UserDefaultUtil.getWidthFrame()) Height : \(UserDefaultUtil.getHeightFrame())"
        } else {
            label?.text = "Empty Data"
        }
    }
    
    @IBAction func ibActionMove(_ sender: UIButton) {
        self.performSegue(withIdentifier: "moveSecond", sender: nil)
        SecondViewController.pushWidth = Int(widthTextField.text!) ?? 0
        SecondViewController.pushHeight = Int(heightTextField.text!) ?? 0
    }
    
    
}


extension ViewController {
    @objc
    func codeMove(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.moveFlg = .modal
        vc.viewWidth = Int(widthTextField.text!) ?? 0
        vc.viewHeight = Int(heightTextField.text!) ?? 0
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
