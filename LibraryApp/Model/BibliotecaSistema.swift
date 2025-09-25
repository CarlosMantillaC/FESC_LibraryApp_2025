//
//  BibliotecaSistema.swift
//  LibraryApp
//
//  Created by Gopenux on 24/09/25.
//

import Foundation

class BibliotecaSistema {
    private let db: DatabaseServiceProtocol
    private let auth: AuthServiceProtocol

    init(db: DatabaseServiceProtocol, auth: AuthServiceProtocol) {
        self.db = db
        self.auth = auth
    }

    func prestarLibro(usuarioId: String, libroId: String) -> String {
        guard auth.verificarUsuario(usuarioId) else {
            return "Usuario no autorizado"
        }

        guard db.libroDisponible(libroId) else {
            return "Libro no disponible"
        }

        db.registrarPrestamo(usuarioId: usuarioId, libroId: libroId)
        return "Préstamo exitoso"
    }
}
