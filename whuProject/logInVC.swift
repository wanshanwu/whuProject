//
//  logInVC.swift
//  whuProject
//
//  Created by Vintony on 2018/3/29.
//  Copyright © 2018年 Vintony. All rights reserved.
//

import UIKit

class logInVC: UIViewController {
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var userPass: UITextField!
    var passFlag = true
    
    @IBAction func showPass(_ sender: UIButton)
    {
        if passFlag == true{
            passFlag = false
            userPass.isSecureTextEntry = false
        }else{
            passFlag = true
            userPass.isSecureTextEntry = true
        }
    }
    
    @IBAction func logIn(_ sender: UIButton)
    {
        print("用户名： \(String(describing: userID.text)) 密码：\(String(describing: userPass.text))")
        print("Log in success!")
        if true{
            self.performSegue(withIdentifier: "LogInToTabBar", sender: self)
        }
    }
    
    @IBAction func forgetPass(_ sender: UIButton)
    {
        print("forget password")
    }
    
    @IBAction func logIntoRegister(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "LogInToRegister", sender: self)
        print("to Register Page")
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
