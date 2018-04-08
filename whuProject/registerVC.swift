//
//  registerVC.swift
//  whuProject
//
//  Created by Vintony on 2018/3/29.
//  Copyright © 2018年 Vintony. All rights reserved.
//

import UIKit

class registerVC: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var phonenumber: UITextField!
    @IBOutlet weak var password1: UITextField!
    @IBOutlet weak var password2: UITextField!
    
    var pass1Flag = true
    var pass2Flag = true
    
    @IBAction func showPass1(_ sender: Any)
    {
        if pass1Flag == true{
            pass1Flag = false
            password1.isSecureTextEntry = false
        }else{
            pass1Flag = true
            password1.isSecureTextEntry = true
        }
    }
    @IBAction func showPass2(_ sender: UIButton)
    {
        if pass2Flag == true{
            pass2Flag = false
            password2.isSecureTextEntry = false
        }else{
            pass2Flag = true
            password2.isSecureTextEntry = true
        }
    }
    @IBAction func register(_ sender: UIButton)
    {
        if password1.text  == password2.text
        {
            print("用户名：\(String(describing: username.text)) 电话：\(String(describing: phonenumber.text)) 密码：\(String(describing: password2.text))")
            let successAlert = UIAlertController(title: "注册成功", message: nil, preferredStyle: .alert)
            self.present(successAlert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            })
            self.performSegue(withIdentifier: "RegisterToLogIn", sender: self)
        }else
        {
            password1.text = ""
            password2.text = ""
            let failAlert = UIAlertController(title: "请确认两次输入的密码相同！", message: nil, preferredStyle: .alert)
            self.present(failAlert, animated: true, completion: nil)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2, execute: {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            })
        }
    }
    
    @IBAction func registerToLogIn(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "RegisterToLogIn", sender: self)
        print("to Log In Page")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
