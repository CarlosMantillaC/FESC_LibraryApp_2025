//
//  BibliotecaPresenterTests.swift
//  LibraryAppTests
//
//  Created by Gopenux on 24/09/25.
//

import XCTest
@testable import LibraryApp

final class BibliotecaPresenterTests: XCTestCase {
    private var presenter: BibliotecaPresenter!
    private var mockView: MockView!
    private var sistema: BibliotecaSistema!

    override func setUp() {
        super.setUp()
        let db = DatabaseServiceStub()
        let auth = AuthServiceStub()
        sistema = BibliotecaSistema(db: db, auth: auth)
        mockView = MockView()
        presenter = BibliotecaPresenter(view: mockView, sistema: sistema)
    }

    override func tearDown() {
        presenter = nil
        sistema = nil
        mockView = nil
        super.tearDown()
    }

    func testPresenterUsuarioNoAutorizado() {
        presenter.prestarLibro(usuarioId: "999", libroId: "A1")
        XCTAssertEqual(mockView.mensajeMostrado, "Usuario no autorizado")
    }

    func testPresenterLibroNoDisponible() {
        presenter.prestarLibro(usuarioId: "123", libroId: "A1")
        presenter.prestarLibro(usuarioId: "123", libroId: "A1")
        XCTAssertEqual(mockView.mensajeMostrado, "Libro no disponible")
    }

    func testPresenterPrestamoExitoso() {
        presenter.prestarLibro(usuarioId: "123", libroId: "B2")
        XCTAssertEqual(mockView.mensajeMostrado, "Préstamo exitoso")
    }
}

private class MockView: BibliotecaViewProtocol {
    var mensajeMostrado: String?

    func mostrarMensaje(_ mensaje: String) {
        mensajeMostrado = mensaje
    }
}
