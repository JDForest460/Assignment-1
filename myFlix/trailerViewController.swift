//
//  trailerViewController.swift
//  myFlix
//
//  Created by Jiade Lin on 3/3/19.
//  Copyright © 2019 Jiade Lin. All rights reserved.
//

import UIKit

class trailerViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var url: URL!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        webView.loadRequest(URLRequest(url: url!))

    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
