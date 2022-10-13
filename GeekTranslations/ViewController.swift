//
//  ViewController.swift
//  GeekTranslations
//
//  Created by Emilly Maia on 12/10/22.
//

import UIKit

class ViewController: UIViewController {

    var coisas = [String]()
    let coredata = CoreDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .green
//        coredata.saveContext(translation: "Mozin Te aminho")
//        coredata.saveContext(translation: "mozao te amao")
        let deucerto = coredata.fetchTranslations()
        // swiftlint: disable all
        for object in deucerto {
            coisas.append(object.value(forKey: "translation") as! String)
        }
        print(coisas)
    }
}

