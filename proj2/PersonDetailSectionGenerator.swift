// CWID: 890568827
// Antonio de Lis
// HW Assignment #2
//
//  PersonDetailSectionGenerator.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 10/27/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class PersonDetailSectionGenerator {

    func generate() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 5
        //
        vGenerator = FieldValueViewGenerator(n:"Claim Title")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        vGenerator = FieldValueViewGenerator(n:"Date")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)

        let bttstackView = UIStackView()
        bttstackView.axis = .horizontal
        bttstackView.distribution = .fill
        bttstackView.spacing = 20
        let btn = UIButton()
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 3
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.blue
        bttstackView.addArrangedSubview(btn)
        stackView.addArrangedSubview(bttstackView)

        vGenerator = FieldValueViewGenerator(n:"Status")
        sView = vGenerator.generate()
        stackView.addArrangedSubview(sView)
        return stackView
    }
}
