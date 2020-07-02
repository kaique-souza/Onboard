//
//  PageTwoViewController.swift
//  Movie
//
//  Created by Kaique Santos Souza on 6/30/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class PageTwoViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var imageScroll: UIImageView!
    @IBOutlet weak var labelDescricaoScroll: UILabel!
    @IBOutlet weak var labelTitulo: UILabel!
    
    // MARK: - life of cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        acessibilityComponents()
        configuraImagem()
        configuraLabelDescricao()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Metodos
    func configuraImagem(){
        imageScroll.layer.cornerRadius = 10
        imageScroll.layer.masksToBounds =  true
        imageScroll.layer.borderColor = UIColor.black.cgColor
        imageScroll.layer.borderWidth = 1
    }
    
    func configuraLabelDescricao(){
        labelDescricaoScroll.sizeToFit()
    }
    
    func acessibilityComponents(){
        labelTitulo.accessibilityLabel = "Titulo do tutorial Scroll"
        labelTitulo.accessibilityHint = "Texto estaico"
        
        imageScroll.isAccessibilityElement = true
        imageScroll.accessibilityLabel = "Imagem exemplificando a listagem de filmes, com barra scroll"
        imageScroll.accessibilityHint = "Imagem"
        
        labelDescricaoScroll.accessibilityHint = "Texto estaico"
    }

}
