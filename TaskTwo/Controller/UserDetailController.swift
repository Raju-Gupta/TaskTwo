//
//  UserDetailController.swift
//  TaskTwo
//
//  Created by Raju Gupta on 01/10/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class UserDetailController: UIViewController {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblCompanyName: UILabel!
    
    var userData : UserDataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblUserName.text = userData?.username
        lblEmail.text = userData?.email
        lblPhone.text = userData?.phone
        lblCompanyName.text = userData?.company.name

    }


}
