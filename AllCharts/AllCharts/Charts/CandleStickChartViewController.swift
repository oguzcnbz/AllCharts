//
//  CandleStickChartViewController.swift
//  deneme
//
//  Created by Oğuz Canbaz on 18.06.2024.
//

import UIKit
import DGCharts

class CandleStickChartViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var candleStickChart: CandleStickChartView!
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareCandleStickChart()
    }
    
    // MARK: - Functions
    
    private func prepareCandleStickChart() {
        // Veri girişi oluşturma
        var entries: [CandleChartDataEntry] = []
        for x in 0..<10 {
            let open = Double(arc4random_uniform(100))
            let close = Double(arc4random_uniform(100))
            let high = max(open, close) + Double(arc4random_uniform(10))
            let low = min(open, close) - Double(arc4random_uniform(10))
            entries.append(CandleChartDataEntry(x: Double(x), shadowH: high, shadowL: low, open: open, close: close))
        }
        
        // Veri seti oluşturma
        let dataSet = CandleChartDataSet(entries: entries, label: "My Data")
        
        // Veri seti renkleri ve çubuk özellikleri
        dataSet.colors = [UIColor.red]
        dataSet.decreasingColor = .red
        dataSet.increasingColor = .green
        dataSet.decreasingFilled = true
        dataSet.increasingFilled = true
        
        // Verileri CandleChartData nesnesine ekleme
        let data = CandleChartData(dataSet: dataSet)
        candleStickChart.data = data
        
        // Candle stick chart özellikleri
        
        // Arka plan rengi
        candleStickChart.backgroundColor = .white
        
        // Grid arka plan rengini ayarlama
        candleStickChart.gridBackgroundColor = .lightGray
        
        // Çizgi (grid) çizgilerinin görünürlüğünü ayarlama
        candleStickChart.drawGridBackgroundEnabled = true
        
        // Sol eksen özellikleri
        let leftAxis = candleStickChart.leftAxis
        leftAxis.labelFont = .boldSystemFont(ofSize: 12)
        leftAxis.setLabelCount(6, force: false)
        leftAxis.labelTextColor = .black
        leftAxis.axisLineColor = .black
        leftAxis.labelPosition = .outsideChart
        
        // Sağ ekseni kapatma
        candleStickChart.rightAxis.enabled = false
        
        // X eksen özellikleri
        let xAxis = candleStickChart.xAxis
        xAxis.labelPosition = .bottom
        xAxis.labelFont = .systemFont(ofSize: 12)
        xAxis.labelTextColor = .black
        xAxis.drawGridLinesEnabled = false
        xAxis.drawAxisLineEnabled = true
        
        // Çizim özellikleri
        candleStickChart.drawBordersEnabled = true
        candleStickChart.borderColor = .black
        candleStickChart.borderLineWidth = 1
        
        // Legend (Açıklama) özellikleri
        let legend = candleStickChart.legend
        legend.font = .systemFont(ofSize: 14)
        legend.textColor = .black
        legend.horizontalAlignment = .center
        legend.verticalAlignment = .bottom
        legend.orientation = .horizontal
        legend.drawInside = false
        
        // Animasyon
        candleStickChart.animate(xAxisDuration: 2.0)
        
        // Candle stick değerleri için etiket gösterimi
        data.setValueFont(.systemFont(ofSize: 10))
        data.setValueTextColor(.black)
    }
}
