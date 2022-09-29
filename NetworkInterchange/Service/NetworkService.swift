//
//  NetworkService.swift
//  NetworkInterchange
//
//  Created by Bedirhan Altun on 29.09.2022.
//

import Foundation

protocol NetworkService{
    func downloadData(_ resource: String) async throws -> [User]
    var type: String {get}
}
