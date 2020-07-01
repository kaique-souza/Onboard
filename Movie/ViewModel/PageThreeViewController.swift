//
//  PageThreeViewController.swift
//  Movie
//
//  Created by Kaique Santos Souza on 6/30/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class PageThreeViewController: UIViewController {

    @IBOutlet weak var labelDescricaoDetalhe: UILabel!
    @IBOutlet weak var imagemDetalhe: UIImageView!
    @IBOutlet weak var labelTitulo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        acessibilityComponets()
        configuraLabelDescricao()
        configuraImagem()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func configuraLabelDescricao(){
        labelDescricaoDetalhe.sizeToFit()
    }
    
    func configuraImagem(){
        imagemDetalhe.layer.cornerRadius = 10
        imagemDetalhe.layer.masksToBounds = true
    }
    
    func acessibilityComponets(){
        labelTitulo.accessibilityLabel = "Titulo do tutorial de visualização do detalhe do filme"
        labelTitulo.accessibilityHint = "Texto estatico"
        
        imagemDetalhe.isAccessibilityElement = true
        imagemDetalhe.accessibilityLabel = "Imagem de exemplo para visualização dos detahes do filme apos o clique na lista"
        imagemDetalhe.accessibilityHint = "Imagem"
        
        labelDescricaoDetalhe.accessibilityHint = "texto estaico"
    }

}
