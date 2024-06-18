//
//  ChartsViewController.swift
//  deneme
//
//  Created by Oğuz Canbaz on 18.06.2024.
//

import UIKit
import DGCharts

class BarChartViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var barChart: BarChartView!
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareBarChart()
    }
    
    // MARK: - Functions
    
    private func prepareBarChart() {
        // Veri girişi oluşturma
        var entries: [BarChartDataEntry] = []
        for x in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(x), y: Double(arc4random_uniform(100))))
        }
        
        // Veri seti oluşturma
        let dataSet = BarChartDataSet(entries: entries, label: "My Data")
        
        // Veri seti renkleri
        dataSet.colors = ChartColorTemplates.material()
        
        // Verileri BarChartData nesnesine ekleme
        let data = BarChartData(dataSet: dataSet)
        barChart.data = data
        
        // Bar chart özellikleri
        
        // Arka plan rengi
        barChart.backgroundColor = .white
        
        // Grid arka plan rengini ayarlama
        barChart.gridBackgroundColor = .lightGray
        
        // Çizgi (grid) çizgilerinin görünürlüğünü ayarlama
        barChart.drawGridBackgroundEnabled = true
        
        // Sol eksen özellikleri
        let leftAxis = barChart.leftAxis
        leftAxis.labelFont = .boldSystemFont(ofSize: 12)
        leftAxis.setLabelCount(6, force: false)
        leftAxis.labelTextColor = .black
        leftAxis.axisLineColor = .black
        leftAxis.labelPosition = .outsideChart
        
        // Sağ ekseni kapatma
        barChart.rightAxis.enabled = false
        
        // X eksen özellikleri
        let xAxis = barChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 12)
        xAxis.labelTextColor = .black
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = true
        
        // Çizim özellikleri
        barChart.drawBordersEnabled = true
        barChart.borderColor = .black
        barChart.borderLineWidth = 1
        
        // Legend (Açıklama) özellikleri
        let legend = barChart.legend
        legend.font = .systemFont(ofSize: 14)
        legend.textColor = .black
        legend.horizontalAlignment = .center
        legend.verticalAlignment = .bottom
        legend.orientation = .horizontal
        legend.drawInside = false
        
        // Animasyon
        barChart.animate(yAxisDuration: 2.0)
        
        // Bar değerleri için etiket gösterimi
        data.setValueFont(.systemFont(ofSize: 10))
        data.setValueTextColor(.black)
    }
}
