//
//  ViewAmarelaController.swift
//  myProject
//
//  Created by Aluno on 24/11/16.
//  Copyright © 2016 Rafael Agostini. All rights reserved.
//

import UIKit

class ViewAmarelaController: UIViewController {

    @IBOutlet weak var lblNome: UILabel!
    var teste = ""
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.lblNome.text = teste
        
        self.myDatePicker.datePickerMode = .date
        
        let dateMinima = "30/01/100"
        let dateMaximo = "30/12/2016"
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        
        self.myDatePicker.minimumDate = formatter.date(from: dateMinima)
        self.myDatePicker.maximumDate = formatter.date(from: dateMaximo)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dateChange(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let strDate = dateFormatter.string(from: self.myDatePicker.date)
        print("Data formatada:\(strDate)")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let alertController = UIAlertController(title: "Compartilhar", message: "Escolha a forma de compartilhamento", preferredStyle: .actionSheet)
        let sendTwitter = UIAlertAction(title: "Twitter", style: .default, handler: { (action) -> Void in })
        let sendFacebook = UIAlertAction(title: "Facebook", style: .default, handler: { (action) -> Void in })
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) -> Void in print("Cancel button tapped") })
        
        alertController.addAction(sendTwitter)
        alertController.addAction(sendFacebook)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
