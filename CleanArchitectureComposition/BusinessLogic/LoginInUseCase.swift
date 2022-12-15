//
//  LoginInUseCase.swift
//  CleanArchitectureComposition
//
//  Created by Roel Castano on 12/15/22.
//

import Foundation

protocol LoginUseCaseOutput {
    func loginSuceeded()
    func loginFailed()
}

final class LoginUseCase {
    
    let composer: LoginUseCaseOutputComposer
    
    init(composer: LoginUseCaseOutputComposer) {
        self.composer = composer
    }
    
    func login(name: String, pwd: String) {
        // call to login service
        
        if true {
            composer.loginSuceeded()
        } else {
            composer.loginFailed()
        }
    }

}
