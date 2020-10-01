//
//  UserViewModel.swift
//  TaskTwo
//
//  Created by Raju Gupta on 01/10/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class UserViewModel : NSObject{
    
    static var userData = [UserDataModel]()
    
    static func getUserData(completion: @escaping([UserDataModel]?, Error?)->Void){
        
        let urlStr = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlStr) else{return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if data != nil{
                
                do{
                    if let data = data{
                        self.userData = try JSONDecoder().decode([UserDataModel].self, from: data)
                        completion(self.userData, nil)
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
