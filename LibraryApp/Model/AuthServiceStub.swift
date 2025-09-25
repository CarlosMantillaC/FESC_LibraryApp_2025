//
//  AuthServiceStub.swift
//  LibraryApp
//
//  Created by Gopenux on 24/09/25.
//

import Foundation

protocol AuthServiceProtocol {
    func verificarUsuario(_ usuarioId: String) -> Bool
}

class AuthServiceStub: AuthServiceProtocol {
    func verificarUsuario(_ usuarioId: String) -> Bool {
        return usuarioId == "123"
    }
}
