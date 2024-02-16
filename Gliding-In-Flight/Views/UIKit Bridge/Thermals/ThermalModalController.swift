//
//  ThermalModal.swift
//  Gliding-In-Flight
//
//  Created by Andrew Stringfellow on 2/15/24.
//

import Foundation
import UIKit

// I dont know if i ned this
class ThermalModalController: UIViewController {
    let parentView: UIView
    let thermal: Thermal
    
    init(parentView: UIView, thermal: Thermal) {
        self.parentView = parentView
        self.thermal = thermal
        
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .pageSheet
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view = generateModalView(parentView: self.parentView)
    }
}

extension ThermalModalController {
    
    func generateModalView(parentView: UIView) -> UIStackView {
        var title = UILabel()
        title.text = "JKLJKL"
        title.backgroundColor = .red
        
        var titleOne = UILabel()
        titleOne.text = "JKLJKL"
        titleOne.backgroundColor = .blue
        
        var modalStack: UIStackView {
            
            
            var modalStack = UIStackView()
            
            var modalFrame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.5)
            modalStack.frame = modalFrame
            
            modalStack.axis = .vertical
            modalStack.alignment = .center
            
            modalStack.addArrangedSubview(title)
            modalStack.addArrangedSubview(titleOne)
            modalStack.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
            return modalStack
        }
        return modalStack
        
    }
}
