//
//  BibliotecaPresenter.swift
//  LibraryApp
//
//  Created by Gopenux on 24/09/25.
//

import Foundation

protocol BibliotecaViewProtocol: AnyObject {
    func mostrarMensaje(_ mensaje: String)
}

class BibliotecaPresenter {
    weak var view: BibliotecaViewProtocol?
    private let sistema: BibliotecaSistema

    init(view: BibliotecaViewProtocol, sistema: BibliotecaSistema) {
        self.view = view
        self.sistema = sistema
    }

    func prestarLibro(usuarioId: String, libroId: String) {
        let resultado = sistema.prestarLibro(usuarioId: usuarioId, libroId: libroId)
        view?.mostrarMensaje(resultado)
    }
}
