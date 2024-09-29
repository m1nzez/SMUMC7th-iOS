//
//  SavedViewController.swift
//  Kream
//
//  Created by 김민지 on 9/23/24.
//

import UIKit

class SavedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView

        // Do any additional setup after loading the view.
    }
    
    private lazy var savedView: SavedView = {
        let view = SavedView()
        
        return view
    }()
}
