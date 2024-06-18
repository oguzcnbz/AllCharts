//
//  DonutDiagramViewController.swift
//  deneme
//
//  Created by Oğuz Canbaz on 7.06.2024.
//

import UIKit

class PieDiagramViewController: UIViewController {
    
    // MARK: -- Components
    
    @IBOutlet weak var pieDiagram: PieDiagram!
    @IBOutlet weak var pieDiagramWithSpace: PieDiagramWithSpace!
    @IBOutlet weak var pieDiagramSpaceColorTitleUnder: PieDiagramSpaceColorTitleUnder!
    @IBOutlet weak var pieDiagramSpaceColorTitleUnderDual: PieDiagramSpaceColorTitleUnderDual!
    @IBOutlet weak var pieDiagramSpaceColorTitleBeside: PieDiagramSpaceColorTitleBeside!
    
    // MARK: -- Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pieDiagram.products = [
            Product(title: "Annual", value: 0.3),
            Product(title: "Monthly", value: 0.2),
            Product(title: "Sİ", value: 0.1),
            Product(title: "Hİ", value: 0.1),
            Product(title: "do", value: 0.1),
            Product(title: "la", value: 0.1),
            Product(title: "re", value: 0.1)
        ]
        
        pieDiagramWithSpace.products = [
            Product(title: "Annual", value: 0.3),
            Product(title: "Monthly", value: 0.2),
            Product(title: "Sİ", value: 0.1),
            Product(title: "Hİ", value: 0.1),
            Product(title: "do", value: 0.1),
            Product(title: "la", value: 0.1),
            Product(title: "re", value: 0.1)
        ]
        
        pieDiagramSpaceColorTitleUnder.products = [
            Product(title: "Annual", value: 0.3),
            Product(title: "Monthly", value: 0.2),
            Product(title: "Sİ", value: 0.1),
            Product(title: "Hİ", value: 0.1),
            Product(title: "do", value: 0.1),
            Product(title: "la", value: 0.1),
            Product(title: "re", value: 0.1)
        ]
        
        pieDiagramSpaceColorTitleBeside.products = [
            Product(title: "Annual", value: 0.3),
            Product(title: "Monthly", value: 0.2),
            Product(title: "Sİ", value: 0.1),
            Product(title: "Hİ", value: 0.1),
            Product(title: "do", value: 0.1),
            Product(title: "la", value: 0.1),
            Product(title: "re", value: 0.1)
        ]
        
        pieDiagramSpaceColorTitleUnderDual.products = [
            Product(title: "Annual", value: 0.3),
            Product(title: "Monthly", value: 0.2),
            Product(title: "Sİ", value: 0.1),
            Product(title: "Hİ", value: 0.1),
            Product(title: "do", value: 0.1),
            Product(title: "la", value: 0.1),
            Product(title: "re", value: 0.1)
        ]
    }
}
