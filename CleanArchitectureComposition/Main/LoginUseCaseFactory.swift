//
//  LoginUseCaseFactory.swift
//  CleanArchitectureComposition
//
//  Created by Roel Castano on 12/15/22.
//

import Foundation

final class LoginUseCaseFactory {
    
    func makeUseCase() -> LoginUseCase? {
        return LoginUseCase(composer: LoginUseCaseOutputComposer(delegates:[
            LoginPresenter(),
            CrashlyticsAnalyticsWrapper(),
            FirebaseAnalyticsWrapper(),
        ]))
    }
    
}
