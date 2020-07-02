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
    var bottomSafeAreaHeight: CGFloat = 15
    var primeiroAcesso = UserDefaults.standard.integer(forKey: "Primeiro_Acesso")
    
    lazy var Paginas: [UIViewController] = {
        return [PageOneViewController(),
                PageTwoViewController(),
                PageThreeViewController()]
    }()
    
    lazy var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.black
        pageControl.pageIndicatorTintColor = UIColor.white
        pageControl.currentPageIndicatorTintColor = UIColor.black
        return pageControl
    }()
    
    lazy var buttonProximo: UIButton = {
        let buttonProximo = UIButton()
        buttonProximo.setTitle("Proximo", for: .normal)
        buttonProximo.setTitleColor(UIColor.white, for: .normal)
        buttonProximo.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 19)
        buttonProximo.addTarget(self, action: #selector(actionbuttonProximo), for: .touchUpInside)
        return buttonProximo
    }()
    
    lazy var buttonAnterior: UIButton = {
        let buttonAnterior = UIButton()
        buttonAnterior.setTitle("Anterior", for: .normal)
        buttonAnterior.setTitleColor(UIColor.white, for: .normal)
        buttonAnterior.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 19)
        buttonAnterior.addTarget(self, action: #selector(actionButtonAnterior), for: .touchUpInside)
        return buttonAnterior
    }()
    
    lazy var buttonPular: UIButton = {
        let buttonPular = UIButton(frame: CGRect(x: 220, y: 50, width: 80, height: 30))
        buttonPular.setTitle("Pular", for: .normal)
        buttonPular.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 19)
        buttonPular.setTitleColor(UIColor.white, for: .normal)
        buttonPular.addTarget(self, action: #selector(actionButtonPular), for: .touchUpInside)
        return buttonPular
    }()
    
    lazy var buttonIniciar: UIButton = {
        let buttonInicar = UIButton()
        buttonInicar.setTitle("Iniciar", for: .normal)
        buttonInicar.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 19)
        buttonInicar.setTitleColor(UIColor.white, for: .normal)
        buttonInicar.addTarget(self, action: #selector(iniciarApp), for: .touchUpInside)
       return buttonInicar
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
        configuraPageControl()
        configuraButtonProximo()
        configureButtonAnterior()
        self.view.addSubview(buttonPular)
    }
    
    // MARK: - Metodos
    func ordemPaginas(_ viewController: UIViewController){
        setViewControllers([viewController],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    func configuraPageControl(){
        self.view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        pageControl.numberOfPages = Paginas.count
        let bottom = NSLayoutConstraint(item: pageControl, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -(120 + bottomSafeAreaHeight))
        
        let centerX = NSLayoutConstraint(item: pageControl, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        
        let height = NSLayoutConstraint(item: pageControl, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30)
        
        let width = NSLayoutConstraint(item: pageControl, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150)
        
        NSLayoutConstraint.activate([bottom, centerX, height, width])
    }
    
    func configuraButtonProximo(){
        self.view.addSubview(buttonProximo)
        buttonProximo.translatesAutoresizingMaskIntoConstraints = false
        
        let bottom = NSLayoutConstraint(item: buttonProximo, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -(30 + bottomSafeAreaHeight))
        
        let rigth = NSLayoutConstraint(item: buttonProximo, attribute: .rightMargin, relatedBy: .equal, toItem: self.view, attribute: .rightMargin, multiplier: 1, constant: -20)

        let width = NSLayoutConstraint(item: buttonProximo, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 75)
        
         let height = NSLayoutConstraint(item: buttonProximo, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        NSLayoutConstraint.activate([bottom, width, height, rigth])
    }
    
    func configureButtonAnterior(){
        self.view.addSubview(buttonAnterior)
        buttonAnterior.translatesAutoresizingMaskIntoConstraints = false
        
        let bottom = NSLayoutConstraint(item: buttonAnterior, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -(30 + bottomSafeAreaHeight))
        
        let left = NSLayoutConstraint(item: buttonAnterior, attribute: .leftMargin, relatedBy: .equal, toItem: self.view, attribute: .leftMargin, multiplier: 1, constant: 20)
        
        let width = NSLayoutConstraint(item: buttonAnterior, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 75)
        
        let height = NSLayoutConstraint(item: buttonAnterior, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        NSLayoutConstraint.activate([bottom, width, height, left])
    }
    
    func configuraButtonIniciar(){
        self.view.addSubview(buttonIniciar)
        buttonIniciar.translatesAutoresizingMaskIntoConstraints = false
        
        let bottom = NSLayoutConstraint(item: buttonIniciar, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1.0, constant: -(36 + bottomSafeAreaHeight))
        
        let left = NSLayoutConstraint(item: buttonAnterior, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: 0)
        
        let width = NSLayoutConstraint(item: buttonAnterior, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 75)
        
        let height = NSLayoutConstraint(item: buttonAnterior, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        NSLayoutConstraint.activate([bottom, width, height, left])
    }
    
    @objc func iniciarApp(){
        actionButtonPular()
    }
    
    @objc func actionbuttonProximo(){
        if pageControl.currentPage == 2 {
            buttonAnterior.removeFromSuperview()
            buttonProximo.removeFromSuperview()
            //configuraButtonIniciar()
        }else{
            pageControl.currentPage += 1
            ordemPaginas(Paginas[pageControl.currentPage])
        }
    }
    
    @objc func actionButtonAnterior(){
        if pageControl.currentPage == 0{
            ordemPaginas(Paginas[pageControl.currentPage])
        }else{
            pageControl.currentPage -= 1
            ordemPaginas(Paginas[pageControl.currentPage])
        }
    }
    
    @objc func actionButtonPular(){
        let quantidade = UserDefaults.standard.integer(forKey: "Primeiro_Acesso") + 1
        UserDefaults.standard.set(quantidade, forKey: "Primeiro_Acesso")
        
        print(UserDefaults.standard.integer(forKey: "Primeiro_Acesso"))
        let homeViewController =  HomeViewController()
        present(homeViewController, animated: true, completion: nil)
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
