//
//  BibliotecaSistemaTests.swift
//  LibraryAppTests
//
//  Created by Gopenux on 24/09/25.
//

import XCTest
@testable import LibraryApp

final class BibliotecaSistemaTests: XCTestCase {
    private var sistema: BibliotecaSistema!
    private var db: DatabaseServiceStub!
    private var auth: AuthServiceStub!

    override func setUp() {
        super.setUp()
        db = DatabaseServiceStub()
        auth = AuthServiceStub()
        sistema = BibliotecaSistema(db: db, auth: auth)
    }

    override func tearDown() {
        sistema = nil
        db = nil
        auth = nil
        super.tearDown()
    }

    func testUsuarioNoAutorizado() {
        let resultado = sistema.prestarLibro(usuarioId: "999", libroId: "A1")
        XCTAssertEqual(resultado, "Usuario no autorizado")
    }

    func testLibroNoDisponible() {
        _ = sistema.prestarLibro(usuarioId: "123", libroId: "A1")
        let resultado = sistema.prestarLibro(usuarioId: "123", libroId: "A1")
        XCTAssertEqual(resultado, "Libro no disponible")
    }

    func testPrestamoExitoso() {
        let resultado = sistema.prestarLibro(usuarioId: "123", libroId: "B2")
        XCTAssertEqual(resultado, "Préstamo exitoso")
    }
}
