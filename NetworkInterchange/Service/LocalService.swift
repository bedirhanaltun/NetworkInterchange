//
//  LocalService.swift
//  NetworkInterchange
//
//  Created by Bedirhan Altun on 29.09.2022.
//

import Foundation

class LocalService: NetworkService{
    var type: String = "LocalService"
    
    
    func downloadData(_ resource: String) async throws -> [User]{
        
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else{
            throw NetworkError.noResponse
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        
        let userModels = try JSONDecoder().decode([User].self, from: data)
        
        return userModels
    }
}
