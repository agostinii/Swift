//
//  ViewController.swift
//  myProject
//
//  Created by Aluno on 22/11/16.
//  Copyright © 2016 Rafael Agostini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTeste: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var `switch`: UISwitch!
    @IBOutlet weak var lblSwitch: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    var myTimer : Timer = Timer()
    @IBOutlet weak var pkOpcoes: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slider.maximumValue = 10
        self.slider.minimumValue = 0.1
        self.slider.value = 5.0
        self.slider.thumbTintColor = UIColor.black
        self.slider.maximumTrackTintColor = UIColor.blue
        self.slider.minimumTrackTintColor = UIColor.red
        
        self.switch.onTintColor = UIColor.darkGray
        self.switch.thumbTintColor = UIColor.red
        
        self.progress.progress = 0
        
        myTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func updateProgress()->Void{
        print(String(self.progress.progress))
        
        self.progress.setProgress(self.progress.progress + 0.1, animated: true)
        
        if self.progress.progress == 1.0 {
            myTimer.invalidate()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnVerde(_ sender: UIButton) {
        
        let vc = ViewVerdeController(nibName: "ViewVerdeController", bundle: nil)
        
        vc.testestring = "hahaha"
        
        self.present(vc, animated: true, completion: nil)
    }

    @IBAction func btnViewAzul(_ sender: UIButton) {
        self.performSegue(withIdentifier: "segueAzul", sender: self)
    }
    
    @IBAction func btnTableView(_ sender: UIButton) {
        let vc = TableViewController(nibName: "TableViewController", bundle: nil)
        
        self.show(vc, sender: self)
    }
    
    @IBAction func btnAmarelo(_ sender: UIButton) {
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = storyBoard.instantiateViewController(withIdentifier: "ViewAmarelaController") as! ViewAmarelaController
        
        vc.teste = "nome da label na tela amarela!"
        
        self.show(vc, sender: self)
        
    }
    
    @IBAction func pressSwitch(_ sender: UISwitch) {
        
        let swt : UISwitch = sender
        
        if swt.isOn {
            self.lblSwitch.text = "Ligado"
        } else {
            self.lblSwitch.text = "Desligado"
        }
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        
        print(sender.value)
        
        self.lblTeste.text = String(format: "%.2f", sender.value)
    }
}

