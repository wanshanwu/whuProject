//
//  fileInfoCell.swift
//  whuProject
//
//  Created by Vintony on 2018/3/30.
//  Copyright © 2018年 Vintony. All rights reserved.
//

import UIKit

class fileInfoCell: UITableViewCell {
    @IBOutlet weak var fileNameLabel: UILabel!
    @IBOutlet weak var fileDateLabel: UILabel!
    @IBOutlet weak var fileSizeLabel: UILabel!
    @IBOutlet weak var fileImageView: UIImageView!
    
    
    var fileName: String = ""{
        didSet{
            if (fileName != oldValue) {
                fileNameLabel.text = fileName
                print(fileNameLabel)
            }
        }
    }
    var fileDate: String = ""{
        didSet{
            if (fileDate != oldValue) {
                fileDateLabel.text = fileDate
                print(fileDateLabel)
            }
        }
    }
    var fileSize: String = ""{
        didSet{
            if (fileSize != oldValue) {
                fileSizeLabel.text = fileSize
                print(fileSizeLabel)
            }
        }
    }
    var fileImageS: String = ""{
        didSet{
            if (fileImageS != oldValue) {
                let image = UIImage(named: fileImageS)
                fileImageView.image = image
                print(fileImageView)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
