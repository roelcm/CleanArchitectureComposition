//
//  CleanArchitectureCompositionTests.swift
//  CleanArchitectureCompositionTests
//
//  Created by Roel Castano on 12/15/22.
//

import XCTest

@testable import CleanArchitectureComposition

final class LoginUseCaseFactoryTests: XCTestCase {
    
    func test_loginFactory_doesNotCrash() throws {
        let factory = LoginUseCaseFactory()
        let loginUseCase = factory.makeUseCase()
        let composer = loginUseCase?.composer
        XCTAssertEqual(composer?.outputs.count, 3)
        XCTAssertEqual(composer?.count(ofType: LoginPresenter.self), 1)
        XCTAssertEqual(composer?.count(ofType: CrashlyticsAnalyticsWrapper.self), 1)
        XCTAssertEqual(composer?.count(ofType: FirebaseAnalyticsWrapper.self), 1)
    }
    
}

private extension LoginUseCaseOutputComposer {
    func count<T>(ofType: T.Type) -> Int {
        return outputs.filter { $0 is T }.count
    }
}
