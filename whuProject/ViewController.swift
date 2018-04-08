//
//  ViewController.swift
//  whuProject
//
//  Created by Vintony on 2018/3/19.
//  Copyright © 2018年 Vintony. All rights reserved.
//

import UIKit
import Contacts

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    func loadContactsData() {
        //获取授权状态
        let status = CNContactStore.authorizationStatus(for: .contacts)
        //判断当前授权状态
        guard status == .authorized else { return }
        
        //创建通讯录对象
        let store = CNContactStore()
        
        //获取Fetch,并且指定要获取联系人中的什么属性
        let keys = [CNContactFamilyNameKey, CNContactGivenNameKey, CNContactNicknameKey,
                    CNContactOrganizationNameKey, CNContactJobTitleKey,
                    CNContactDepartmentNameKey, CNContactNoteKey, CNContactPhoneNumbersKey,
                    CNContactEmailAddressesKey, CNContactPostalAddressesKey,
                    CNContactDatesKey, CNContactInstantMessageAddressesKey
        ]
        
        //创建请求对象
        //需要传入一个(keysToFetch: [CNKeyDescriptor]) 包含CNKeyDescriptor类型的数组
        let request = CNContactFetchRequest(keysToFetch: keys as [CNKeyDescriptor])
        
        //遍历所有联系人
        do {
            try store.enumerateContacts(with: request, usingBlock: {
                (contact : CNContact, stop : UnsafeMutablePointer<ObjCBool>) -> Void in
                
                //获取姓名
                let lastName = contact.familyName
                let firstName = contact.givenName
                print("姓名：\(lastName)\(firstName)")
                
                //获取昵称
                let nikeName = contact.nickname
                print("昵称：\(nikeName)")
                
                //获取公司（组织）
                let organization = contact.organizationName
                print("公司（组织）：\(organization)")
                
                //获取职位
                let jobTitle = contact.jobTitle
                print("职位：\(jobTitle)")
                
                //获取部门
                let department = contact.departmentName
                print("部门：\(department)")
                
                //获取备注
                let note = contact.note
                print("备注：\(note)")
                
                //获取电话号码
                print("电话：")
                for phone in contact.phoneNumbers {
                    //获得标签名（转为能看得懂的本地标签名，比如work、home）
                    var label = "未知标签"
                    if phone.label != nil {
                        label = CNLabeledValue<NSString>.localizedString(forLabel:
                            phone.label!)
                    }
                    
                    //获取号码
                    let value = phone.value.stringValue
                    print("\t\(label)：\(value)")
                }
                
                //获取Email
                print("Email：")
                for email in contact.emailAddresses {
                    //获得标签名（转为能看得懂的本地标签名）
                    var label = "未知标签"
                    if email.label != nil {
                        label = CNLabeledValue<NSString>.localizedString(forLabel:
                            email.label!)
                    }
                    
                    //获取值
                    let value = email.value
                    print("\t\(label)：\(value)")
                }
                
                //获取地址
                print("地址：")
                for address in contact.postalAddresses {
                    //获得标签名（转为能看得懂的本地标签名）
                    var label = "未知标签"
                    if address.label != nil {
                        label = CNLabeledValue<NSString>.localizedString(forLabel:
                            address.label!)
                    }
                    
                    //获取值
                    let detail = address.value
                    let contry = detail.value(forKey: CNPostalAddressCountryKey) ?? ""
                    let state = detail.value(forKey: CNPostalAddressStateKey) ?? ""
                    let city = detail.value(forKey: CNPostalAddressCityKey) ?? ""
                    let street = detail.value(forKey: CNPostalAddressStreetKey) ?? ""
                    let code = detail.value(forKey: CNPostalAddressPostalCodeKey) ?? ""
                    let str = "国家:\(contry) 省:\(state) 城市:\(city) 街道:\(street)"
                        + " 邮编:\(code)"
                    print("\t\(label)：\(str)")
                }
                
                //获取纪念日
                print("纪念日：")
                for date in contact.dates {
                    //获得标签名（转为能看得懂的本地标签名）
                    var label = "未知标签"
                    if date.label != nil {
                        label = CNLabeledValue<NSString>.localizedString(forLabel:
                            date.label!)
                    }
                    
                    //获取值
                    let dateComponents = date.value as DateComponents
                    let value = NSCalendar.current.date(from: dateComponents)
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
                    print("\t\(label)：\(dateFormatter.string(from: value!))")
                }
                
                //获取即时通讯(IM)
                print("即时通讯(IM)：")
                for im in contact.instantMessageAddresses {
                    //获得标签名（转为能看得懂的本地标签名）
                    var label = "未知标签"
                    if im.label != nil {
                        label = CNLabeledValue<NSString>.localizedString(forLabel:
                            im.label!)
                    }
                    
                    //获取值
                    let detail = im.value
                    let username = detail.value(forKey: CNInstantMessageAddressUsernameKey)
                        ?? ""
                    let service = detail.value(forKey: CNInstantMessageAddressServiceKey)
                        ?? ""
                    print("\t\(label)：\(username) 服务:\(service)")
                }
                
                print("----------------")
                
            })
        } catch {
            print(error)
        }
    }
    
    
    let cellIdentifier = "fileViewCellIdentifier"
    //@IBOutlet var tableView: UITableView!
    let fileInfo = [
        ["FileName" : "photo00", "FileDate" : "2018-08-08 08:08", "FileSize" : "1.38M", "FileType" : "photo"],
        ["FileName" : "photo01", "FileDate" : "2018-08-08 08:08", "FileSize" : "1.38M", "FileType" : "photo"],
        ["FileName" : "photo02", "FileDate" : "2018-08-08 08:08", "FileSize" : "1.38M", "FileType" : "photo"],
        ["FileName" : "photo03", "FileDate" : "2018-08-08 08:08", "FileSize" : "1.38M", "FileType" : "photo"],
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        return fileInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath : IndexPath)-> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath as IndexPath) as! fileInfoCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! fileViewCell
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
        // Do any additional setup after loading the view, typically from a nib.
        //tableView.register(fileViewCell.self, forCellReuseIdentifier: cellIdentifier)
        //let nib = UINib(nibName: "fileViewCell", bundle: nil)
        //tableView.register(nib, forCellReuseIdentifier: cellIdentifier)
        CNContactStore().requestAccess(for: .contacts) { (isRight,error) in
            if isRight{
                self.loadContactsData()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

