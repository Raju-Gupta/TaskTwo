//
//  ViewController.swift
//  TaskTwo
//
//  Created by Raju Gupta on 01/10/20.
//  Copyright © 2020 Raju Gupta. All rights reserved.
//

import UIKit

class UserListController: UIViewController, UISearchBarDelegate, UISearchControllerDelegate{
    
    @IBOutlet weak var tableView : UITableView!
    var userAllData = [UserDataModel]()
    var searchResult = [UserDataModel]()
    var searchcontroller = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarSetUp()
        userDataSetUp()
    }
    
    func searchBarSetUp(){
        self.extendedLayoutIncludesOpaqueBars = true
        searchcontroller.searchResultsUpdater = self
        definesPresentationContext = true
        searchcontroller.searchBar.placeholder = "Search by Name"
        searchcontroller.searchBar.delegate = self
        navigationItem.searchController = searchcontroller
        navigationItem.hidesSearchBarWhenScrolling = false
        searchcontroller.obscuresBackgroundDuringPresentation = false
    }
    
    func userDataSetUp(){
        UserViewModel.getUserData { (user, error) in
            if user != nil{
                self.userAllData = user!
                self.searchResult = user!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
}

extension UserListController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userAllData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = userAllData[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "UserDetailController") as! UserDetailController
        vc.userData = userAllData[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension UserListController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        
        guard let searchText = searchController.searchBar.text?.lowercased() else{return}
        
        if searchText == ""{
            userAllData = searchResult
        }else{
            userAllData = searchResult
            userAllData = searchResult.filter{$0.name!.lowercased().contains(searchText)}
        }
        tableView.reloadData()
    }
    
    
}

