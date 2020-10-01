//
//  UserDataModel.swift
//  TaskTwo
//
//  Created by Raju Gupta on 01/10/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import Foundation

struct UserDataModel : Codable{
    var id : Int?
    var name : String?
    var username: String?
    var email : String?
    var address : UserAddress
    var phone : String?
    var website : String?
    var company: CompanyDetails
}

struct UserAddress : Codable{
    var street : String?
    var suite : String?
    var city : String?
    var zipcode : String?
    var geo : UserGeoLocation
}

struct UserGeoLocation : Codable{
    var lat : String?
    var lng : String?
}

struct CompanyDetails : Codable{
    var name: String?
    var catchPhrase: String?
    var bs: String?
}

