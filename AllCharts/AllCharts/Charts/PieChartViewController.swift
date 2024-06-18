//
//  PieChartViewController.swift
//  deneme
//
//  Created by Oğuz Canbaz on 18.06.2024.
//

import UIKit
import DGCharts

class PieChartViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var pieChart: PieChartView!
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparePieChart()
    }
    
    // MARK: - Functions
    
    private func preparePieChart() {
        // Veri girişi oluşturma
        var entries: [PieChartDataEntry] = []
        for x in 0..<5 {
            entries.append(PieChartDataEntry(value: Double(arc4random_uniform(100)), label: "Part \(x)"))
        }
        
        // Veri seti oluşturma
        let dataSet = PieChartDataSet(entries: entries, label: "My Data")
        
        // Veri seti renkleri
        dataSet.colors = ChartColorTemplates.vordiplom()
        
        // Verileri PieChartData nesnesine ekleme
        let data = PieChartData(dataSet: dataSet)
        pieChart.data = data
        
        // Pie chart özellikleri
        
        // Arka plan rengi
        pieChart.backgroundColor = .white
        
        // Merkezi deliğin yarıçapını ayarlama
        pieChart.holeRadiusPercent = 0.4
        
        // Merkezi deliğin rengini ayarlama
        pieChart.holeColor = .clear
        
        // Tanımlama (description) metnini ayarlama
        pieChart.chartDescription.text = "My Pie Chart"
        
        // Legend (Açıklama) özellikleri
        let legend = pieChart.legend
        legend.font = .systemFont(ofSize: 14)
        legend.textColor = .black
        legend.horizontalAlignment = .center
        legend.verticalAlignment = .bottom
        legend.orientation = .horizontal
        legend.drawInside = false
        
        // Animasyon
        pieChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        // Pie dilim değerleri için etiket gösterimi
        data.setValueFont(.systemFont(ofSize: 10))
        data.setValueTextColor(.black)
    }
}
