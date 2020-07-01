//
//  PagenOneViewController.swift
//  Movie
//
//  Created by Kaique Santos Souza on 6/30/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class PageOneViewController: UIViewController {
    
    // MARK: - Atributos
    
    // MARK: - Outlets
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var imagemSearch: UIImageView!
    @IBOutlet weak var labelDescricaoSearch: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        acessibilityComponentes()
        configuraLabelDescricao()
        animateImage()
        ConfiguraImagem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func ConfiguraImagem(){
        imagemSearch.layer.cornerRadius = 10
        imagemSearch.layer.masksToBounds = true
    }
    
    func configuraLabelDescricao(){
        labelDescricaoSearch.sizeToFit()
    }
    
    func animateImage(){
        let chacoalhar = CABasicAnimation(keyPath: "position")
        
        chacoalhar.duration = 0.4
        chacoalhar.repeatCount = 2
        chacoalhar.autoreverses = true
        
        let posicaoInicial = CGPoint(x: imagemSearch.center.x, y: imagemSearch.center.y + 5)
        chacoalhar.fromValue = posicaoInicial
        
        let posicaoFinal = CGPoint(x: imagemSearch.center.x, y: imagemSearch.center.y - 5)
        chacoalhar.toValue = posicaoFinal
        imagemSearch.layer.add(chacoalhar, forKey: nil)

    }
    
    func acessibilityComponentes(){
        labelTitulo.accessibilityLabel = "Titulo do tutorial barra de status"
        labelTitulo.accessibilityHint = "Texto estatico"
        
        imagemSearch.accessibilityLabel = "Imagem de exemplo, contendo o campo de pesquisa"
        imagemSearch.accessibilityHint = "Imagem"
        imagemSearch.isAccessibilityElement = true
        
        labelDescricaoSearch.accessibilityHint = "Texto estatico"
        labelDescricaoSearch.accessibilityLabel = labelDescricaoSearch.text
    }
}












//        UIView.animate(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, options: <#T##UIView.AnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
