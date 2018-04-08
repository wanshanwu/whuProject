//
//  fileInfoVC.swift
//  whuProject
//
//  Created by Vintony on 2018/3/29.
//  Copyright © 2018年 Vintony. All rights reserved.
//

import UIKit

class fileInfoVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "fileInfoCell"
    let fileInfo = [
        ["FileName" : "photo00", "FileDate" : "2018-08-08 08:08", "FileSize" : "1.38M", "FileType" : "photo"],
        ["FileName" : "photo01", "FileDate" : "2018-08-08 08:08", "FileSize" : "1.38M", "FileType" : "photo"],
        ["FileName" : "photo02", "FileDate" : "2018-08-08 08:08", "FileSize" : "1.38M", "FileType" : "photo"],
        ["FileName" : "photo03", "FileDate" : "2018-08-08 08:08", "FileSize" : "1.38M", "FileType" : "photo"],
        ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        return fileInfo.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 77.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! fileInfoCell
        let rowData = fileInfo[indexPath.row]
        cell.fileName = rowData["FileName"]!
        cell.fileDate = rowData["FileDate"]!
        cell.fileSize = rowData["FileSize"]!
        if rowData["FileType"] == "photo"{
            cell.fileImageS = "Image 24px"
        }
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //tableView.register(fileInfoCell.self, forCellReuseIdentifier: cellIdentifier)
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
