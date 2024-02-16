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
    let thermal: Thermal
    
    init(thermal: Thermal) {
        self.thermal = thermal
        
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .pageSheet
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view = generateModalView()
    }
}

extension ThermalModalController {
    
    func generateModalView() -> UIView {
        let modalView = UIView()
        
        var title = UILabel()
        title.text = "JKLJKL"
        title.backgroundColor = .red
        
        var titleOne = UILabel()
        titleOne.text = "JKLJKL"
        titleOne.backgroundColor = .blue
        
        var modalStack: UIStackView {
            var modalStack = UIStackView()
            modalStack.axis = .vertical
            
            
            modalStack.addArrangedSubview(title)
            modalStack.addArrangedSubview(titleOne)
            modalStack.backgroundColor = UIColor(white: 1.0, alpha: 0.2)
            return modalStack
        }
        modalView.addSubview(modalStack)
        return modalView
    }
}


class ThermalModel: UIStackView {
    
}
