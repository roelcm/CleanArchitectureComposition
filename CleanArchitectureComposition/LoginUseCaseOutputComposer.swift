//
//  ComposeLoginUseCaseDelegate.swift
//  CleanArchitectureComposition
//
//  Created by Roel Castano on 12/15/22.
//

import Foundation

final class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    
    private var outputs: [LoginUseCaseOutput]
    
    init(delegates: [LoginUseCaseOutput]) {
        self.outputs = delegates
    }
    
    func loginSuceeded() {
        for output in outputs {
            output.loginSuceeded()
        }
    }
    
    func loginFailed() {
        for output in outputs {
            output.loginFailed()
        }
    }
    
}
