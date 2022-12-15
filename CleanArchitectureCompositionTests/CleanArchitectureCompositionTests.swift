//
//  CleanArchitectureCompositionTests.swift
//  CleanArchitectureCompositionTests
//
//  Created by Roel Castano on 12/15/22.
//

import XCTest

@testable import CleanArchitectureComposition

final class CleanArchitectureCompositionTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_emptyComposer_doesNotCrash() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let composer = LoginUseCaseOutputComposer(delegates: [])
        let loginUseCase = LoginUseCase(composer: composer)
        loginUseCase.login(name: "user", pwd: "pwd")
    }

    func test_oneComposer_doesNotCrash() throws {
        let testDelegate = LoginUseCaseOutputSpy()
        let composer = LoginUseCaseOutputComposer(delegates: [testDelegate])
        let loginUseCase = LoginUseCase(composer: composer)
        loginUseCase.login(name: "user", pwd: "pwd")
        
        XCTAssertEqual(testDelegate.succeededCount, 1)
    }

    func test_multipleComposers_doesNotCrash() throws {
        let testDelegate1 = LoginUseCaseOutputSpy()
        let testDelegate2 = LoginUseCaseOutputSpy()
        let testDelegate3 = LoginUseCaseOutputSpy()
        let composer = LoginUseCaseOutputComposer(delegates: [testDelegate1, testDelegate2, testDelegate3])
        let loginUseCase = LoginUseCase(composer: composer)
        loginUseCase.login(name: "user", pwd: "pwd")
        
        XCTAssertEqual(testDelegate1.succeededCount, 1)
        XCTAssertEqual(testDelegate2.succeededCount, 1)
        XCTAssertEqual(testDelegate3.succeededCount, 1)
    }

    private class LoginUseCaseOutputSpy: LoginUseCaseOutput {
        var succeededCount: Int = 0
        var failedCount: Int = 0
        
        func loginFailed() {
            failedCount += 1
        }
        
        func loginSuceeded() {
            succeededCount += 1
        }
    }
    
}
