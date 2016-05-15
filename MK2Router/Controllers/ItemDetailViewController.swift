//
//  ItemDetailViewController.swift
//  MK2Router
//
//  Created by k2o on 2016/05/14.
//  Copyright © 2016年 Yuichi Kobayashi. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController, Destination {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.navigationController?.viewControllers.count == 1 {
            let dismissButton = UIBarButtonItem(barButtonSystemItem: .Stop, target: self, action: #selector(dismiss))
            self.navigationItem.leftBarButtonItem = dismissButton
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        self.loadItem()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func showContactForm(sender: UIButton) {
        guard let itemID = self.context else {
            return
        }
        
        self.performRoute(.ContactForm(itemID))
    }

    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func loadItem() {
        guard let itemID = self.context else {
            return
        }

        ItemProvider.shared.getItemDetail(itemID) { (item) in
            self.imageView.image = item.image
            self.titleLabel.text = item.title
            self.detailTextView.text = item.detail
        }
    }
    
    // MARK: - Router Destination
    
    typealias Context = Int
    var context: Int?
}
