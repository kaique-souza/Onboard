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
    @IBOutlet weak var imagemSearch: UIImageView!
    @IBOutlet weak var labelDescricaoSearch: UILabel!
    // MARK: - Life of cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        labelDescricaoSearch.sizeToFit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
