//
//  CityDetailViewController.swift
//  Weather
//
//  Created by Александр on 06.04.2021.
//

import UIKit

class CityDetailViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet weak var weekForecast: UITableView!
    @IBOutlet weak var tableHight: NSLayoutConstraint!
    @IBOutlet weak var whiteBackgroundView: NSLayoutConstraint!
    @IBOutlet weak var hourlyForecastHeight: NSLayoutConstraint!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var weeklyTableBackground: UIView!
    @IBOutlet weak var humidityBackground: UIView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Set up background shapes
        DesignManager.setBackgroundStandartShape(layer: weeklyTableBackground.layer)
        DesignManager.setBackgroundStandartShape(layer: humidityBackground.layer)
        
        //Set up background shadows
        DesignManager.setBackgroundStandartShadow(layer: weeklyTableBackground.layer)
        DesignManager.setBackgroundStandartShadow(layer: humidityBackground.layer)
        
        //Getting rid of the gap at the bottom
        scrollView.contentInsetAdjustmentBehavior = .never
    }
    
    override func viewWillLayoutSubviews() {
        super.updateViewConstraints()
        
        //Set tableview height according to its contents
        //tableHight.constant = weekForecast.contentSize.height
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        whiteBackgroundView.constant = view.frame.height - (hourlyForecastHeight.constant + 60)
        
        let gradient = CAGradientLayer()
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.locations = [NSNumber(floatLiteral: 0.0), NSNumber(floatLiteral: 1.0)]
        gradient.colors = [UIColor(red: 68/255, green: 166/255, blue: 252/255, alpha: 1).cgColor,
                                      UIColor(red: 114/255, green: 225/255, blue: 253/255, alpha: 1).cgColor]
        gradient.frame = backgroundView.bounds
        
        backgroundView.layer.insertSublayer(gradient, at: 0)
    }
    
    @IBAction func exitButtonPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //Helper functions
    func applyBackgroundDesign(to view: UIView) {
        
    }
}

extension CityDetailViewController: UITableViewDataSource, UITableViewDelegate {
    
    // TODO: here should be weekly forecast
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "\(indexPath.row)"
        
        return cell
    }
    
}
