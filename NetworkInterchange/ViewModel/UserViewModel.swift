//
//  UserViewModel.swift
//  NetworkInterchange
//
//  Created by Bedirhan Altun on 29.09.2022.
//

import Foundation

class UserListViewModel: ObservableObject{
    @Published var usersModel = [UserViewModel]()
    
    private var resource = ""
    private var service: NetworkService
    
    init(service: NetworkService){
        self.service = service
    }
    
    func downloadUsers() async{
        
        
        if service.type == "WebService"{
            resource = Constants.URLs.usersURL
        }
        else{
            resource = Constants.Path.base
        }
        
        do{
            let users = try await service.downloadData(resource)
            DispatchQueue.main.async {
                self.usersModel = users.map(UserViewModel.init)
            }
             
        }
        catch{
            print(error)
        }
    }
}

struct UserViewModel{
    
    let user: User
    
    var id: Int{
        user.id
    }
    
    var name: String{
        user.name
    }
    
    var username: String{
        user.username
    }
    
    var email: String{
        user.email
    }
    
    var telephone: String{
        user.phone
    }
}
