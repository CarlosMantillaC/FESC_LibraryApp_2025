//
//  LibraryUITests.swift
//  LibraryAppUITests
//
//  Created by Gopenux on 24/09/25.
//

import XCTest

final class LibraryUITests: XCTestCase {

    func testLibraryUI() throws {
        let app = XCUIApplication()
        app.activate()
        let idUsuarioTextField = app/*@START_MENU_TOKEN@*/.textFields["ID Usuario"]/*[[".otherElements.textFields[\"ID Usuario\"]",".textFields[\"ID Usuario\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        idUsuarioTextField.tap()
        
        let idLibroTextField = app/*@START_MENU_TOKEN@*/.textFields["ID Libro"]/*[[".otherElements.textFields[\"ID Libro\"]",".textFields[\"ID Libro\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        idLibroTextField.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Prestar Libro"]/*[[".buttons.staticTexts[\"Prestar Libro\"]",".staticTexts.firstMatch",".staticTexts[\"Prestar Libro\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
}
