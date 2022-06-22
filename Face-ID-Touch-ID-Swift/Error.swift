//
//  Error.swift
//  Face-ID-Touch-ID-Swift
//
//  Created by Luccas Santana Marinho on 21/06/22.
//

import UIKit

class Error: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
        
        self.view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
    
    lazy var label: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Erro!"
        lbl.textColor = .white
        return lbl
    }()
}
