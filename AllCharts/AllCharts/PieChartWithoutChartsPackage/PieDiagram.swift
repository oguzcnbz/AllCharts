//
//  DonutDiagram.swift
//  deneme
//
//  Created by Oğuz Canbaz on 6.06.2024.
//

import UIKit

// MARK: -- Struct

struct Product {
    let title: String
    let value: Double
}

class PieDiagram: UIView {
    
    // MARK: -- Properties
    
    var products: [Product] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // MARK: -- Life Cycles
    
    override func draw(_ rect: CGRect) {
        guard !products.isEmpty else { return }
        
        let total = products.reduce(0) { $0 + $1.value }
        var startAngle: CGFloat = -.pi / 2
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let outerRadius = min(rect.width, rect.height) / 2 * 0.8
        let innerRadius = outerRadius * 0.6
        
        let context = UIGraphicsGetCurrentContext()
        
        for product in products {
            context?.setFillColor(randomColor().cgColor)
            let endAngle = startAngle + .pi * 2 * CGFloat(product.value / total)
            
            context?.move(to: CGPoint(x: center.x + innerRadius * cos(startAngle), y: center.y + innerRadius * sin(startAngle)))
            context?.addArc(center: center, radius: outerRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context?.addArc(center: center, radius: innerRadius, startAngle: endAngle, endAngle: startAngle, clockwise: true)
            context?.closePath()
            context?.fillPath()
            
            startAngle = endAngle
        }
        
        drawLabels(in: rect, center: center, outerRadius: outerRadius, innerRadius: innerRadius)
    }
    
    // MARK: -- Functions
    
    private func randomColor() -> UIColor {
        return UIColor(hue: CGFloat(drand48()), saturation: 0.7, brightness: 0.8, alpha: 1)
    }
    
    // Renkleri Kendin Vermek istiyorsan aşağıdaki fonksiyonlar
    
    //    private let colors: [UIColor] = [
    //            UIColor.red,
    //            UIColor.green,
    //            UIColor.blue,
    //            UIColor.orange,
    //            UIColor.purple,
    //            UIColor.yellow
    //        ]
    //
    //    override func draw(_ rect: CGRect) {
    //            guard !products.isEmpty else { return }
    //
    //            let total = products.reduce(0) { $0 + $1.value }
    //            var startAngle: CGFloat = -.pi / 2  // Başlangıç açısı
    //            let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
    //            let outerRadius = min(rect.width, rect.height) / 2 * 0.8
    //            let innerRadius = outerRadius * 0.6
    //
    //            let context = UIGraphicsGetCurrentContext()
    //
    //            for (index, product) in products.enumerated() {
    //                let colorIndex = index % colors.count
    //                context?.setFillColor(colors[colorIndex].cgColor)
    //                let endAngle = startAngle + .pi * 2 * CGFloat(product.value / total)
    //
    //                context?.move(to: CGPoint(x: center.x + innerRadius * cos(startAngle), y: center.y + innerRadius * sin(startAngle)))
    //                context?.addArc(center: center, radius: outerRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
    //                context?.addArc(center: center, radius: innerRadius, startAngle: endAngle, endAngle: startAngle, clockwise: true)
    //                context?.closePath()
    //                context?.fillPath()
    //
    //                startAngle = endAngle
    //            }
    //
    //            drawLabels(in: rect, center: center, outerRadius: outerRadius, innerRadius: innerRadius)
    //        }
    
    
    
    private func drawLabels(in rect: CGRect, center: CGPoint, outerRadius: CGFloat, innerRadius: CGFloat) {
        let total = products.reduce(0) { $0 + $1.value }
        var startAngle: CGFloat = -.pi / 2
        for product in products {
            let endAngle = startAngle + .pi * 2 * CGFloat(product.value / total)
            let midAngle = (startAngle + endAngle) / 2
            let labelRadius = (outerRadius + innerRadius) / 2
            let labelCenter = CGPoint(
                x: center.x + labelRadius * cos(midAngle),
                y: center.y + labelRadius * sin(midAngle)
            )
            let label = UILabel()
            label.text = product.title
            label.font = UIFont.systemFont(ofSize: 12)
            label.sizeToFit()
            label.center = labelCenter
            addSubview(label)
            startAngle = endAngle
        }
    }
}
