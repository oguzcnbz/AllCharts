//
//  BubbleStickChartViewController.swift
//  deneme
//
//  Created by Oğuz Canbaz on 18.06.2024.
//

import UIKit
import DGCharts

class BubbleChartViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var bubbleChart: BubbleChartView!
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareBubbleChart()
    }
    
    // MARK: - Functions
    
    private func prepareBubbleChart() {
        // Veri girişi oluşturma
        var entries: [BubbleChartDataEntry] = []
        for x in 0..<10 {
            let size = Double(arc4random_uniform(10) + 1)
            entries.append(BubbleChartDataEntry(x: Double(x), y: Double(arc4random_uniform(100)), size: size))
        }
        
        // Veri seti oluşturma
        let dataSet = BubbleChartDataSet(entries: entries, label: "My Data")
        
        // Veri seti renkleri ve balon özellikleri
        dataSet.colors = ChartColorTemplates.material()
        
        // Verileri BubbleChartData nesnesine ekleme
        let data = BubbleChartData(dataSet: dataSet)
        bubbleChart.data = data
        
        // Bubble chart özellikleri
        
        // Arka plan rengi
        bubbleChart.backgroundColor = .white
        
        // Grid arka plan rengini ayarlama
        bubbleChart.gridBackgroundColor = .lightGray
        
        // Çizgi (grid) çizgilerinin görünürlüğünü ayarlama
        bubbleChart.drawGridBackgroundEnabled = true
        
        // Sol eksen özellikleri
        let leftAxis = bubbleChart.leftAxis
        leftAxis.labelFont = .boldSystemFont(ofSize: 12)
        leftAxis.setLabelCount(6, force: false)
        leftAxis.labelTextColor = .black
        leftAxis.axisLineColor = .black
        leftAxis.labelPosition = .outsideChart
        
        // Sağ ekseni kapatma
        bubbleChart.rightAxis.enabled = false
        
        // X eksen özellikleri
        let xAxis = bubbleChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 12)
        xAxis.labelTextColor = .black
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = true
        
        // Çizim özellikleri
        bubbleChart.drawBordersEnabled = true
        bubbleChart.borderColor = .black
        bubbleChart.borderLineWidth = 1
        
        // Legend (Açıklama) özellikleri
        let legend = bubbleChart.legend
        legend.font = .systemFont(ofSize: 14)
        legend.textColor = .black
        legend.horizontalAlignment = .center
        legend.verticalAlignment = .bottom
        legend.orientation = .horizontal
        legend.drawInside = false
        
        // Animasyon
        bubbleChart.animate(xAxisDuration: 2.0)
        
        // Bubble değerleri için etiket gösterimi
        data.setValueFont(.systemFont(ofSize: 10))
        data.setValueTextColor(.black)
    }
}
