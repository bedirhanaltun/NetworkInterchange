//
//  WebService.swift
//  NetworkInterchange
//
//  Created by Bedirhan Altun on 29.09.2022.
//

import Foundation

enum NetworkError: Error{
    case wrongURL
    case noResponse
}

class WebService: NetworkService{
    var type: String = "WebService"
    
    
    func downloadData(_ resource: String) async throws -> [User]{
        
        guard let url = URL(string: resource) else{
            throw NetworkError.wrongURL
        }
        
        let (data,response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                throw NetworkError.noResponse
        }
        return try JSONDecoder().decode([User].self, from: data)
    }
}
