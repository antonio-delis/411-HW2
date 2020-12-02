// CWID: 890568827
// Antonio de Lis
// HW Assignment #2
//  ViewController.swift
//  SimpleHTTPClient1
//
//  Created by ITLoaner on 10/6/20.
//  Copyright © 2020 ITLoaner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    func refreshScreen(pObj : Claim) {
        vals[0].text = pObj.title
        vals[1].text = pObj.date
    }

    var lbls = [UILabel]()
    var vals = [UITextField]()
    var addBtn : UIButton!
    var pService : PersonService!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 1.Prepare the UI Screen
        let vGenerator = PersonDetailSectionGenerator()
        let sView = vGenerator.generate()
        //
        view.addSubview(sView)
        //
        let topText = UILabel.init()
        topText.frame = CGRect(x: 10.0, y:40.0, width: UIScreen.main.bounds.size.width - 20.0, height: 21.0)
        topText.text = "Please Enter Claim Information"
        topText.textAlignment = .central
        view.addSubview(topText)

        let cViews = sView.arrangedSubviews
        //vals = [UITextField]()
        for sv in cViews {  // 3 of them
            let innerStackView = sv as! UIStackView
            let cnt = innerStackView.arrangedSubviews.count
            if cnt > 1 {
                for ve in innerStackView.arrangedSubviews { // 2 of them
                    if ve is UITextField {
                        vals.append(ve as! UITextField)
                    } else {
                        lbls.append(ve as! UILabel)
                    }
                }
            } else {
                addBtn = innerStackView.arrangedSubviews[0] as? UIButton
            }
        }
        //
        for i in 0...vals.count-1 {
            vals[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = vals[i].leadingAnchor.constraint(equalTo: vals[0].leadingAnchor)
            constr.isActive = true
        }
        //
        sView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = sView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let lCont = sView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trCont = sView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true

        // 2. Retrieve data
        let pService = PersonService(vc : self)
        // Testing getAll() method
        pService.getAll()

    }


}
