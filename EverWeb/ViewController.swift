//
//  ViewController.swift
//  EverWeb
//
//  Created by Francesco on 2/07/16.
//  Copyright © 2016 Francesco. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    let wkWebView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationController?.navigationBar.tintColor = UIColor.greenColor()
        initWkWebView()
        loadEvernoteWeb()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func initWkWebView() {
       let userAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4) AppleWebKit/600.7.12 (KHTML, like Gecko) Version/8.0.7 Safari/600.7.12";
        
        wkWebView.navigationDelegate = self
        wkWebView.customUserAgent = userAgent
        view.addSubview(wkWebView)
        
        wkWebView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[subview]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["subview": wkWebView]))
        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-0-[subview]-0-|", options: .DirectionLeadingToTrailing, metrics: nil, views: ["subview": wkWebView]))
       
    }
    
    @IBAction func onRefreshBtnTouchUpInside(sender: AnyObject) {
        loadEvernoteWeb()
    }
    
    func loadEvernoteWeb() {
        let everNoteURL = NSURL(string: "https://www.evernote.com/Home.action")
        wkWebView.loadRequest(NSURLRequest(URL: everNoteURL!))
    }
    
    func webView(webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: NSError) {
        print(error)
    }
}

