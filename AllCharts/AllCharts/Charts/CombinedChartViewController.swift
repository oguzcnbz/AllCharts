//
//  CombinedChartViewController.swift
//  deneme
//
//  Created by Oğuz Canbaz on 18.06.2024.
//

import UIKit
import DGCharts

class CombinedChartViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var combinedChart: CombinedChartView!
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCombinedChart()
    }
    
    // MARK: - Functions
    
    private func prepareCombinedChart() {
        // Line chart veri girişi oluşturma
        var lineEntries: [ChartDataEntry] = []
        for x in 0..<10 {
            lineEntries.append(ChartDataEntry(x: Double(x), y: Double(arc4random_uniform(100))))
        }
        
        // Line veri seti oluşturma
        let lineDataSet = LineChartDataSet(entries: lineEntries, label: "Line Data")
        lineDataSet.colors = [UIColor.blue]
        lineDataSet.lineWidth = 2.5
        
        // Bar chart veri girişi oluşturma
        var barEntries: [BarChartDataEntry] = []
        for x in 0..<10 {
            barEntries.append(BarChartDataEntry(x: Double(x), y: Double(arc4random_uniform(100))))
        }
        
        // Bar veri seti oluşturma
        let barDataSet = BarChartDataSet(entries: barEntries, label: "Bar Data")
        barDataSet.colors = [UIColor.red]
        
        // Verileri CombinedChartData nesnesine ekleme
        let data = CombinedChartData()
        data.lineData = LineChartData(dataSet: lineDataSet)
        data.barData = BarChartData(dataSet: barDataSet)
        combinedChart.data = data
        
        // Combined chart özellikleri
        
        // Arka plan rengi
        combinedChart.backgroundColor = .white
        
        // Grid arka plan rengini ayarlama
        combinedChart.gridBackgroundColor = .lightGray
        
        // Çizgi (grid) çizgilerinin görünürlüğünü ayarlama
        combinedChart.drawGridBackgroundEnabled = true
        
        // Sol eksen özellikleri
        let leftAxis = combinedChart.leftAxis
        leftAxis.labelFont = .boldSystemFont(ofSize: 12)
        leftAxis.setLabelCount(6, force: false)
        leftAxis.labelTextColor = .black
        leftAxis.axisLineColor = .black
        leftAxis.labelPosition = .outsideChart
        
        // Sağ ekseni kapatma
        combinedChart.rightAxis.enabled = false
        
        // X eksen özellikleri
        let xAxis = combinedChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 12)
        xAxis.labelTextColor = .black
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = true
        
        // Çizim özellikleri
        combinedChart.drawBordersEnabled = true
        combinedChart.borderColor = .black
        combinedChart.borderLineWidth = 1
        
        // Legend (Açıklama) özellikleri
        let legend = combinedChart.legend
        legend.font = .systemFont(ofSize: 14)
        legend.textColor = .black
        legend.horizontalAlignment = .center
        legend.verticalAlignment = .bottom
        legend.orientation = .horizontal
        legend.drawInside = false
        legend.xEntrySpace = 20
        
        // Animasyon
        combinedChart.animate(xAxisDuration: 2.0)
        
        // Combined chart değerleri için etiket gösterimi
        data.setValueFont(.systemFont(ofSize: 10))
        data.setValueTextColor(.black)
    }
}
