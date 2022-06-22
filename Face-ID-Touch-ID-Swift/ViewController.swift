//
//  ViewController.swift
//  Face-ID-Touch-ID-Swift
//
//  Created by Luccas Santana Marinho on 21/06/22.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 80),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .link
        button.setTitle("Toque aqui", for: .normal)
        button.addTarget(self, action: #selector(tocouNoBotao), for: .touchUpInside)
        return button
    }()
    
    @objc func tocouNoBotao() {
        let context = LAContext()
        var error: NSError? = nil
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Por favor, autorize o uso do Face/Touch ID"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, error in
                DispatchQueue.main.async {
                    guard success, error == nil else {
                        let vc = Error()
                        vc.modalTransitionStyle = .crossDissolve
                        vc.modalPresentationStyle = .fullScreen
                        self?.present(vc, animated: true)
                        return
                    }
                    
                    let vc = Success()
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self?.present(vc, animated: true)
                }
            }
        } else {
            let alert = UIAlertController(title: "Deu erro", message: "Nao está usando", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Voltar", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
}
