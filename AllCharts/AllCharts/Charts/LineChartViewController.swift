//
//  LineChartViewController.swift
//  deneme
//
//  Created by Oğuz Canbaz on 18.06.2024.
//

import UIKit
import DGCharts

class LineChartViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var lineChart: LineChartView!
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareLineChart()
    }
    
    // MARK: - Functions
    
    private func prepareLineChart() {
        // Veri girişi oluşturma
        var entries: [ChartDataEntry] = []
        for x in 0..<10 {
            entries.append(ChartDataEntry(x: Double(x), y: Double(arc4random_uniform(100))))
        }
        
        // Veri seti oluşturma
        let dataSet = LineChartDataSet(entries: entries, label: "My Data")
        
        // Veri seti renkleri ve çizgi özellikleri
        dataSet.colors = [UIColor.blue]
        dataSet.lineWidth = 2.5
        dataSet.circleColors = [UIColor.red]
        dataSet.circleHoleColor = .white
        
        // Verileri LineChartData nesnesine ekleme
        let data = LineChartData(dataSet: dataSet)
        lineChart.data = data
        
        // Line chart özellikleri
        
        // Arka plan rengi
        lineChart.backgroundColor = .white
        
        // Grid arka plan rengini ayarlama
        lineChart.gridBackgroundColor = .lightGray
        
        // Çizgi (grid) çizgilerinin görünürlüğünü ayarlama
        lineChart.drawGridBackgroundEnabled = true
        
        // Sol eksen özellikleri
        let leftAxis = lineChart.leftAxis
        leftAxis.labelFont = .boldSystemFont(ofSize: 12)
        leftAxis.setLabelCount(6, force: false)
        leftAxis.labelTextColor = .black
        leftAxis.axisLineColor = .black
        leftAxis.labelPosition = .outsideChart
        
        // Sağ ekseni kapatma
        lineChart.rightAxis.enabled = false
        
        // X eksen özellikleri
        let xAxis = lineChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 12)
        xAxis.labelTextColor = .black
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = true
        
        // Çizim özellikleri
        lineChart.drawBordersEnabled = true
        lineChart.borderColor = .black
        lineChart.borderLineWidth = 1
        
        // Legend (Açıklama) özellikleri
        let legend = lineChart.legend
        legend.font = .systemFont(ofSize: 14)
        legend.textColor = .black
        legend.horizontalAlignment = .center
        legend.verticalAlignment = .bottom
        legend.orientation = .horizontal
        legend.drawInside = false
        
        // Animasyon
        lineChart.animate(xAxisDuration: 2.0)
        
        // Çizgi değerleri için etiket gösterimi
        data.setValueFont(.systemFont(ofSize: 10))
        data.setValueTextColor(.black)
    }
}
