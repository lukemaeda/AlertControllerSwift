//
//  ViewController.swift
//  AlertControllerSwift
//
//  Created by MAEDAHAJIME on 2015/07/11.
//  Copyright (c) 2015年 MAEDA HAJIME. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // [通知（ボタン１つ OK）]ボタン押す
    @IBAction func proc01(sender: UIButton) {
        
        let ac:UIAlertController = UIAlertController(title: "Title",
                                                   message: "Message",
                                            preferredStyle: .Alert)
        
        let defaultAction:UIAlertAction = UIAlertAction(title: "OK",
                                                        style: .Default,
                                                      handler: nil)
        ac.addAction(defaultAction)
        
        presentViewController(ac, animated: true, completion: nil)
    }
    
    // [通知（ボタン２つ OK CANCEL）]ボタン押す
    @IBAction func proc02(sender: UIButton) {
        
        let ac:UIAlertController = UIAlertController(title: "Title",
                                                   message: "Message",
                                            preferredStyle: .Alert)
        
        let otherAction:UIAlertAction = UIAlertAction(title: "OK",
                                                      style: .Default) {
            action in println("OK!")
        }
        let cancelAction:UIAlertAction = UIAlertAction(title: "CANCEL",
                                                       style: .Cancel) {
            action in println("CANCEL!")
        }
        
        ac.addAction(otherAction)
        ac.addAction(cancelAction)
        presentViewController(ac, animated: true, completion: nil)
    }

    // 下から選択（ボタン１つ）
    @IBAction func proc03(sender: UIButton) {
        
        let ac:UIAlertController = UIAlertController(title: "Title",
                                                   message: "Message",
                                            preferredStyle: .ActionSheet)
        
        let defaultAction:UIAlertAction = UIAlertAction(title: "OK", style: .Default,
                                                      handler: nil)
        ac.addAction(defaultAction)
        
        //For ipad And Univarsal Device
        ac.popoverPresentationController?.sourceView = sender as UIView;
        ac.popoverPresentationController?.sourceRect = CGRect(x: (sender.frame.width/2),
                                                              y: sender.frame.height,
                                                          width: 0,
                                                         height: 0)
        
        presentViewController(ac, animated: true, completion: nil)
    }
    
    // 下から選択（ボタン複数）
    @IBAction func proc04(sender: UIButton) {
        
        let ac:UIAlertController = UIAlertController(title: "Title",
                                                   message: "Message",
                                            preferredStyle: .ActionSheet)
        
        let firstAction:UIAlertAction = UIAlertAction(title: "First",
                                                      style: .Default) {
            action in println("First")
        }
        let secondAction:UIAlertAction = UIAlertAction(title: "Second",
                                                       style: .Default) {
            action in println("Second")
        }
        let cancelAction:UIAlertAction = UIAlertAction(title: "CANCEL",
                                                       style: .Cancel) {
            action in println("CANCEL")
        }
        
        ac.addAction(firstAction)
        ac.addAction(secondAction)
        ac.addAction(cancelAction)
        
        //For ipad And Univarsal Device
        ac.popoverPresentationController?.sourceView = sender as UIView;
        ac.popoverPresentationController?.sourceRect = CGRect(x: (sender.frame.width/2),
                                                              y: sender.frame.height,
                                                          width: 0,
                                                         height: 0)
        
        ac.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.Up
        
        presentViewController(ac, animated: true, completion: nil)
    }
    
    // 入力フォームをダイアログで表示
    @IBAction func proc05(sender: UIButton) {
        var inputTextField: UITextField?
        var passwordField: UITextField?
        
        let ac: UIAlertController = UIAlertController(title: "ログイン",
                                                    message: "ID and Password",
                                             preferredStyle: .Alert)
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel",
                                                        style: .Cancel)
                                                        { action -> Void in
            println("CANCEL")
        }
        ac.addAction(cancelAction)
        
        let logintAction: UIAlertAction = UIAlertAction(title: "Login",
                                                        style: .Default)
                                                        { action -> Void in
            println("Login")
            println(inputTextField?.text)
            println(passwordField?.text)
        }
        ac.addAction(logintAction)
        
        ac.addTextFieldWithConfigurationHandler { textField -> Void in
            inputTextField = textField
            textField.placeholder = "ID"
        }
        ac.addTextFieldWithConfigurationHandler { textField -> Void in
            passwordField = textField
            textField.secureTextEntry = true
            textField.placeholder = "password"
        }
        
        presentViewController(ac, animated: true, completion: nil)
    }
}
