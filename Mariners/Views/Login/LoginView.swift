//
//  LoginView.swift
//  Mariners
//
//  Created by Gavin Daniel on 8/14/22.
//

import Amplify
import SwiftUI

struct LoginView: View {
    
//    @StateObject var viewModel = ViewModel()
    
//    let onLogin: (User) -> Void
    
    var body: some View {
        VStack {
//            TextField("Username", text: $viewModel.username)
//                .padding()
//                .background(Color(.secondarySystemBackground))
//                .clipShape(Capsule())
//                .padding(.horizontal, 40)
//            
//            TextField("Email", text: $viewModel.email)
//                .padding()
//                .background(Color(.secondarySystemBackground))
//                .clipShape(Capsule())
//                .padding(.horizontal, 40)
//            
//            Button("Login") {
//                viewModel.login(completion: onLogin)
//            }
//            .padding()
//            .foregroundColor(.white)
//            .background(Color.purple)
//            .clipShape(Capsule())
        }
    }
}

//extension LoginView {
//    class ViewModel: ObservableObject {
//        @Published var username = String()
//        @Published var email = String()
//
//        func login(completion: @escaping (User) -> Void) {
//            // 1
//            Amplify.DataStore.query(User.self, byId: username) { result in
//
//                if let queriedUser = try? result.get() {
//                    print("queried user", queriedUser)
//                    completion(queriedUser)
//
//                } else {
//
//                    // 2
//                    let newUser = User(id: username, username: username, email: email)
//                    Amplify.DataStore.save(newUser) { result in
//                        do {
//                            let savedUser = try result.get()
//                            print("saved user", savedUser)
//                            completion(savedUser)
//
//                        } catch {
//                            print(error)
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView(viewModel: LoginView.ViewModel())
//    }
//}
