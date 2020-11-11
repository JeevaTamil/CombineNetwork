//
//  UserListView.swift
//  CombineNetwork
//
//  Created by Azhagusundaram Tamil on 11/11/20.
//

import SwiftUI

struct UserListView: View {
    @StateObject var userListVM = UserListViewModel()
   
    var body: some View {
        ZStack {
            if userListVM.userViewModels.isEmpty {
                ProgressView()
            } else {
                List {
                    ForEach(userListVM.userViewModels, id:\.id) { user in
                        HStack {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.blue)
                            VStack (alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.email)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Users")
        .onAppear{
            userListVM.fetchUsers(endpoint: .users)
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}
