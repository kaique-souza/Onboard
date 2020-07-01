//
//  PageViewController.swift
//  Movie
//
//  Created by Kaique Santos Souza on 6/30/20.
//  Copyright © 2020 Kaique Santos Souza. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource{
    
    // MARK: - Atributos
    var primeiroAcesso = UserDefaults.standard.set(0, forKey: "Primeiro_Acesso")
    
    lazy var Paginas: [UIViewController] = {
        return [PageOneViewController(),
                PageTwoViewController(),
                PageThreeViewController()]
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl(frame: CGRect(x: 0,y: UIScreen.main.bounds.maxY - 70,width: UIScreen.main.bounds.width,height: 50))
        pageControl.numberOfPages = Paginas.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        return pageControl
    }()
    
    lazy var buttonProximo: UIButton = {
        let buttonProximo = UIButton(frame: CGRect(x: 220, y: 500, width: 70, height: 30))
        buttonProximo.setTitle("Proximo", for: .normal)
        buttonProximo.setTitleColor(UIColor.black, for: .normal)
        buttonProximo.addTarget(self, action: #selector(actionbuttonProximo), for: .touchUpInside)
        return buttonProximo
    }()
    
    lazy var buttonAnterior: UIButton = {
        let buttonAnterior = UIButton(frame: CGRect(x: 20, y: 500, width: 70, height: 30))
        buttonAnterior.setTitle("Anterior", for: .normal)
        buttonAnterior.setTitleColor(UIColor.black, for: .normal)
        buttonAnterior.addTarget(self, action: #selector(actionButtonAnterior), for: .touchUpInside)
        return buttonAnterior
    }()
    
    lazy var buttonPular: UIButton = {
        let buttonPular = UIButton(frame: CGRect(x: 220, y: 50, width: 80, height: 30))
        buttonPular.setTitle("Pular", for: .normal)
        buttonPular.setTitleColor(UIColor.black, for: .normal)
        buttonPular.addTarget(self, action: #selector(actionButtonPular), for: .touchUpInside)
        return buttonPular
    }()

    // MARK: - life of cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource =  self
        
        if let primeiroViewController = Paginas.first {
            ordemPaginas(primeiroViewController)
        }
        acessibilityComponents()
        self.view.addSubview(pageControl)
        self.view.addSubview(buttonProximo)
        self.view.addSubview(buttonAnterior)
        self.view.addSubview(buttonPular)
    }
    
    // MARK: - Metodos
    func ordemPaginas(_ viewController: UIViewController){
        setViewControllers([viewController],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }

    @objc func actionbuttonProximo(){
        if pageControl.currentPage == 2 {
            pageControl.currentPage = 0
            ordemPaginas(Paginas[pageControl.currentPage])
        }else{
            pageControl.currentPage += 1
            ordemPaginas(Paginas[pageControl.currentPage])
        }
    }
    
    @objc func actionButtonAnterior(){
        if pageControl.currentPage == 0{
            pageControl.currentPage = 2
            ordemPaginas(Paginas[pageControl.currentPage])
        }else{
            pageControl.currentPage -= 1
            ordemPaginas(Paginas[pageControl.currentPage])
        }
    }
    
    @objc func actionButtonPular(){
        let quantidade = UserDefaults.standard.integer(forKey: "Primero_Acesso") + 1
        UserDefaults.standard.set(quantidade, forKey: "Primero_Acesso")
        
        print(UserDefaults.standard.integer(forKey: "Primero_Acesso"))
        let homeViewController =  HomeViewController()
        present(homeViewController, animated: true, completion: nil)
    }

    func configuraLabel(){
       
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = Paginas.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else {
            return Paginas.last
        }
        
        guard Paginas.count > previousIndex else {
            return nil
        }
        
        return Paginas[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = Paginas.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = Paginas.count
        guard orderedViewControllersCount != nextIndex else {
            return Paginas.first
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return Paginas[nextIndex]
    }
    
    func acessibilityComponents(){
        buttonPular.accessibilityLabel = "De um clique caso queira pular tutorial"
        
        buttonProximo.accessibilityLabel = "De um clique caso queira passar para a proxima explicação"
        
        buttonAnterior.accessibilityLabel = "De um clique caso queira voltar para a explicação anterior"
        
        pageControl.accessibilityLabel = "Marcador de paginas"
        pageControl.accessibilityHint = "Page Control"
        
    }

}
