//
//  CompositionDelegateRecorder.swift
//  CleanArchitectureCompositionTests
//
//  Created by Roel Castano on 12/15/22.
//

import Foundation

final class CompositionDelegateRecorder: LoginUseCaseOutput {
    var succeededCount: Int = 0
    var failedCount: Int = 0
    
    func loginFailed() {
        failedCount += 1
    }
    
    func loginSuceeded() {
        succeededCount += 1
    }
}
