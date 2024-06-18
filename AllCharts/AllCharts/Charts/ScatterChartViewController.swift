//
//  ScatterChartViewController.swift
//  deneme
//
//  Created by Oğuz Canbaz on 18.06.2024.
//

import UIKit
import DGCharts

class ScatterChartViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var scatterChart: ScatterChartView!
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareScatterChart()
    }
    
    // MARK: - Functions
    
    private func prepareScatterChart() {
        // Veri girişi oluşturma
        var entries: [ChartDataEntry] = []
        for x in 0..<10 {
            entries.append(ChartDataEntry(x: Double(x), y: Double(arc4random_uniform(100))))
        }
        
        // Veri seti oluşturma
        let dataSet = ScatterChartDataSet(entries: entries, label: "My Data")
        
        // Veri seti renkleri ve şekilleri
        dataSet.colors = [UIColor.green]
        dataSet.scatterShapeHoleRadius = 10
        dataSet.scatterShapeSize = 10
        
        // Verileri ScatterChartData nesnesine ekleme
        let data = ScatterChartData(dataSet: dataSet)
        scatterChart.data = data
        
        // Scatter chart özellikleri
        
        // Arka plan rengi
        scatterChart.backgroundColor = .white
        
        // Grid arka plan rengini ayarlama
        scatterChart.gridBackgroundColor = .lightGray
        
        // Çizgi (grid) çizgilerinin görünürlüğünü ayarlama
        scatterChart.drawGridBackgroundEnabled = true
        
        // Sol eksen özellikleri
        let leftAxis = scatterChart.leftAxis
        leftAxis.labelFont = .boldSystemFont(ofSize: 12)
        leftAxis.setLabelCount(6, force: false)
        leftAxis.labelTextColor = .black
        leftAxis.axisLineColor = .black
        leftAxis.labelPosition = .outsideChart
        
        // Sağ ekseni kapatma
        scatterChart.rightAxis.enabled = false
        
        // X eksen özellikleri
        let xAxis = scatterChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 12)
        xAxis.labelTextColor = .black
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = true
        
        // Çizim özellikleri
        scatterChart.drawBordersEnabled = true
        scatterChart.borderColor = .black
        scatterChart.borderLineWidth = 1
        
        // Legend (Açıklama) özellikleri
        let legend = scatterChart.legend
        legend.font = .systemFont(ofSize: 14)
        legend.textColor = .black
        legend.horizontalAlignment = .center
        legend.verticalAlignment = .bottom
        legend.orientation = .horizontal
        legend.drawInside = false
        
        // Animasyon
        scatterChart.animate(xAxisDuration: 2.0)
        
        // Scatter değerleri için etiket gösterimi
        data.setValueFont(.systemFont(ofSize: 10))
        data.setValueTextColor(.black)
    }
}
