//
//  PagenOneViewController.swift
//  Movie
//
//  Created by Kaique Santos Souza on 6/30/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class PageOneViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var imagemSearch: UIImageView!
    @IBOutlet weak var labelDescricaoSearch: UILabel!
    // MARK: - life of cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        acessibilityComponentes()
        configuraLabelDescricao()
        configuraImagem()
        configuraLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    // MARK: - Metodos
    func configuraImagem() {
        imagemSearch.layer.cornerRadius = 10
        imagemSearch.layer.masksToBounds = true
        imagemSearch.layer.borderColor = UIColor.black.cgColor
        imagemSearch.layer.borderWidth = 1
    }
    func configuraLabelDescricao() {
        labelDescricaoSearch.sizeToFit()
    }
    func modelIdentifier() -> String {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
            return simulatorModelIdentifier
        }
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(bytes: Data(bytes: &sysinfo.machine,
                    count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
    }

    func configuraLabel() {
        let device = modelIdentifier()
        if device == "iPhone8,4"{
            labelTitulo.font = UIFont(name: Strings.FonteRoboto, size: 17)
            labelDescricaoSearch.font = UIFont(name: Strings.FonteRoboto, size: 15)
        }
    }
    func acessibilityComponentes() {
        labelTitulo.accessibilityLabel = "Titulo do tutorial barra de status"
        labelTitulo.accessibilityHint = "Texto estatico"
        imagemSearch.accessibilityLabel = "Imagem de exemplo, contendo o campo de pesquisa"
        imagemSearch.accessibilityHint = "Imagem"
        imagemSearch.isAccessibilityElement = true
        labelDescricaoSearch.accessibilityHint = "Texto estatico"
        labelDescricaoSearch.accessibilityLabel = labelDescricaoSearch.text
    }
}
