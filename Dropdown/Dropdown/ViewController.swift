//
//  ViewController.swift
//  Dropdown
//
//  Created by Admin on 24/12/18.
//  Copyright © 2018 VISHAL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnFruit: UIButton!
    @IBOutlet weak var tblview: UITableView!
    
    @IBOutlet weak var btnShow: UIButton!
    @IBOutlet weak var lbltext: UILabel!
    
    
    var fruites = ["Orange", "Banana", "Apple", "Mango", "graps", "Blueberry", "Cherry"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblview.isHidden = true
        self.lbltext.isHidden = true
        self.lbltext.text = "The methods in the UIConstraintBasedLayoutDebugging category on UIView listed in <UIKitCore/UIView.h> may also be helpful."
    }

    @IBAction func fruiteDropDownClick(_ sender: UIButton) {
        if tblview.isHidden {
            animate(toggle: true, type: btnFruit)
        } else{
            animate(toggle: false, type: btnFruit)
        }
    }
    
    @IBAction func onClickShow(_ sender: UIButton) {
        if lbltext.isHidden {
            animate(toggle: true, type: btnShow)
        } else{
            animate(toggle: false, type: btnShow)
        }
    }
    
    func animate(toggle: Bool, type: UIButton){
        if type == btnFruit {
            if toggle {
                UIView.animate(withDuration: 0.3) {
                    self.tblview.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.tblview.isHidden = true
                }
            }
        } else {
            if toggle {
                UIView.animate(withDuration: 0.3) {
                    self.lbltext.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    self.lbltext.isHidden = true
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = fruites[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        btnFruit.setTitle(fruites[indexPath.row], for: .normal)
        animate(toggle: false, type: btnFruit)
    }
}

