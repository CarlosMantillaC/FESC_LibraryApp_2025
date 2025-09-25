//
//  DatabaseServiceStub.swift
//  LibraryApp
//
//  Created by Gopenux on 24/09/25.
//

import Foundation

protocol DatabaseServiceProtocol {
    func libroDisponible(_ libroId: String) -> Bool
    func registrarPrestamo(usuarioId: String, libroId: String)
}

class DatabaseServiceStub: DatabaseServiceProtocol {
    private var librosDisponibles: Set<String> = ["A1", "B2", "C3"]

    func libroDisponible(_ libroId: String) -> Bool {
        return librosDisponibles.contains(libroId)
    }

    func registrarPrestamo(usuarioId: String, libroId: String) {
        librosDisponibles.remove(libroId)
        print("Préstamo registrado: Usuario \(usuarioId) → Libro \(libroId)")
    }
}
