//
//  BibliotecaViewController.swift
//  LibraryApp
//
//  Created by Gopenux on 24/09/25.
//

import UIKit

class BibliotecaViewController: UIViewController, BibliotecaViewProtocol {
    private var presenter: BibliotecaPresenter!

    private let usuarioTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "ID Usuario"
        tf.borderStyle = .roundedRect
        return tf
    }()

    private let libroTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "ID Libro"
        tf.borderStyle = .roundedRect
        return tf
    }()

    private let prestarButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Prestar Libro", for: .normal)
        return btn
    }()

    private let mensajeLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.numberOfLines = 0
        return lbl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Biblioteca MVP"
        view.backgroundColor = .white

        let db = DatabaseServiceStub()
        let auth = AuthServiceStub()
        let sistema = BibliotecaSistema(db: db, auth: auth)
        presenter = BibliotecaPresenter(view: self, sistema: sistema)

        setupUI()
    }

    private func setupUI() {
        let stack = UIStackView(arrangedSubviews: [usuarioTextField, libroTextField, prestarButton, mensajeLabel])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])

        prestarButton.addTarget(self, action: #selector(prestarLibro), for: .touchUpInside)
    }

    @objc private func prestarLibro() {
        let usuarioId = usuarioTextField.text ?? ""
        let libroId = libroTextField.text ?? ""
        presenter.prestarLibro(usuarioId: usuarioId, libroId: libroId)
    }

    func mostrarMensaje(_ mensaje: String) {
        mensajeLabel.text = mensaje
    }
}
