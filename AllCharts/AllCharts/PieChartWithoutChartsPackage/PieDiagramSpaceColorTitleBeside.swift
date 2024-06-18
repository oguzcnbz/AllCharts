//
//  DonutDiagramWithColorsAndTitles.swift
//  deneme
//
//  Created by Oğuz Canbaz on 7.06.2024.
//

import UIKit

class PieDiagramSpaceColorTitleBeside: UIView {
    
    // MARK: - Properties
    
    var products: [Product] = [] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private let colors: [UIColor] = [
        UIColor.orange,
        UIColor.purple,
        UIColor.yellow
    ]
    
    private let gap: CGFloat = 0.1
    
    // MARK: - Life Cycles
    
    override func draw(_ rect: CGRect) {
        guard !products.isEmpty else { return }
        
        let total = products.reduce(0) { $0 + $1.value }
        var startAngle: CGFloat = -.pi / 2
        
        
        let diagramWidth = rect.width * 0.7
        let legendWidth = rect.width * 0.3
        let center = CGPoint(x: diagramWidth / 2, y: rect.height / 2)
        let outerRadius = min(diagramWidth, rect.height) / 2 * 0.8
        let innerRadius = outerRadius * 0.6
        
        let context = UIGraphicsGetCurrentContext()
        
        for (index, product) in products.enumerated() {
            let colorIndex = index % colors.count
            context?.setFillColor(colors[colorIndex].cgColor)
            let endAngle = startAngle + .pi * 2 * CGFloat(product.value / total) - gap
            
            context?.move(to: CGPoint(x: center.x + innerRadius * cos(startAngle), y: center.y + innerRadius * sin(startAngle)))
            context?.addArc(center: center, radius: outerRadius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            context?.addArc(center: center, radius: innerRadius, startAngle: endAngle, endAngle: startAngle, clockwise: true)
            context?.closePath()
            context?.fillPath()
            
            startAngle = endAngle + gap
        }
        
        drawLabels(in: rect, center: center, outerRadius: outerRadius, innerRadius: innerRadius)
        drawLegend(in: CGRect(x: diagramWidth, y: 0, width: legendWidth, height: rect.height))
    }
    
    // MARK: - Functions
    
    private func drawLabels(in rect: CGRect, center: CGPoint, outerRadius: CGFloat, innerRadius: CGFloat) {
        let total = products.reduce(0) { $0 + $1.value }
        var startAngle: CGFloat = -.pi / 2
        for product in products {
            let endAngle = startAngle + .pi * 2 * CGFloat(product.value / total) - gap
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
            startAngle = endAngle + gap
        }
    }
    
    private func drawLegend(in rect: CGRect) {
        let legendHeight: CGFloat = 20
        let legendSpacing: CGFloat = 10
        let totalLegendHeight = CGFloat(products.count) * (legendHeight + legendSpacing) - legendSpacing
        
        let startY = (rect.height - totalLegendHeight) / 2
        
        for (index, product) in products.enumerated() {
            let colorIndex = index % colors.count
            let legendY = startY + CGFloat(index) * (legendHeight + legendSpacing)
            
            let colorView = UIView(frame: CGRect(x: rect.origin.x, y: legendY, width: legendHeight, height: legendHeight))
            colorView.backgroundColor = colors[colorIndex]
            addSubview(colorView)
            
            let label = UILabel(frame: CGRect(x: rect.origin.x + legendHeight + 10, y: legendY, width: rect.width - legendHeight - 10, height: legendHeight))
            label.text = product.title
            label.font = UIFont.systemFont(ofSize: 14)
            label.textColor = .black
            addSubview(label)
        }
    }
}
