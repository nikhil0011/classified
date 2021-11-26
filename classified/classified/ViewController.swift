//
//  ViewController.swift
//  classified
//
//  Created by Nikhil Nangia on 26/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("LColor \(LColor.primary)")
        print("LColor \(AliasFontToken.bodyLarge)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.navigationController?.pushViewController(ListingViewController(), animated: true)
        }
        // Do any additional setup after loading the view.
    }
}

