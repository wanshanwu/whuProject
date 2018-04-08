//
//  enterVC.swift
//  whuProject
//
//  Created by Vintony on 2018/3/29.
//  Copyright © 2018年 Vintony. All rights reserved.
//

import UIKit

class enterVC: UIViewController {

    @IBAction func toRegisterPage(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "MainToRegister", sender: self)
        print("to Register Page")
    }
    @IBAction func toLogInPage(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "MainToLogIn", sender: self)
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
