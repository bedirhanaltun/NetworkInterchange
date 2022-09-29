//
//  ContentView.swift
//  NetworkInterchange
//
//  Created by Bedirhan Altun on 29.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var userViewModel: UserListViewModel
    
    init(){
        self.userViewModel = UserListViewModel(service: LocalService())
    }
    
    var body: some View {
        List(userViewModel.usersModel, id: \.id){ user in
            VStack{
                Text(user.name)
                    .font(.title3)
                    .foregroundColor(.orange)
                    .frame( maxWidth: .infinity, alignment: .leading)
                Text(user.email)
                    .foregroundColor(.green)
                    .frame( maxWidth: .infinity, alignment: .leading)
                Text(user.username)
                    .foregroundColor(.indigo)
                    .frame( maxWidth: .infinity, alignment: .leading)
                Text(user.telephone)
                    .foregroundColor(.pink)
                    .frame( maxWidth: .infinity, alignment: .leading)
            }
        }.task {
            await userViewModel.downloadUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
