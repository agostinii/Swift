//
//  ViewVerdeController.swift
//  myProject
//
//  Created by Aluno on 24/11/16.
//  Copyright © 2016 Rafael Agostini. All rights reserved.
//

import UIKit

class ViewVerdeController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    var testestring = ""
    @IBOutlet weak var load: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.webView.delegate = self
        self.webView.loadRequest(URLRequest(url: URL(string: "http://google.com.br")!))
        // Do any additional setup after loading the view.
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.load.stopAnimating()
    }

    @IBAction func btnFechar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
