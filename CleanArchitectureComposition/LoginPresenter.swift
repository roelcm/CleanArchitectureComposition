//
//  LoginPresenter.swift
//  CleanArchitectureComposition
//
//  Created by Roel Castano on 12/15/22.
//

import Foundation

final class LoginPresenter: LoginUseCaseOutput {
    
    func loginFailed() {
        print("Login Failed")
    }
    
    func loginSuceeded() {
        print("Login Succeeded")
    }

}
