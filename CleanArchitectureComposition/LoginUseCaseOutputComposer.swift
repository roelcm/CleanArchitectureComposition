//
//  ComposeLoginUseCaseDelegate.swift
//  CleanArchitectureComposition
//
//  Created by Roel Castano on 12/15/22.
//

import Foundation

final class LoginUseCaseOutputComposer: LoginUseCaseOutput {
    
    private let outputs: [LoginUseCaseOutput]
    
    init(delegates: [LoginUseCaseOutput]) {
        self.outputs = delegates
    }
    
    func loginSuceeded() {
        outputs.forEach { $0.loginSuceeded() }
    }
    
    func loginFailed() {
        outputs.forEach { $0.loginFailed() }
    }
    
}
