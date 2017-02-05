//
//  DetailViewController.swift
//  MyDiary
//
//  Created by Eunjoo on 2017. 1. 30..
//  Copyright © 2017년 Eunjoo. All rights reserved.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var myDiary: Diary!
    var photos = List<Picture>()
    
    @IBOutlet weak var diaryDate: UILabel!
    @IBOutlet weak var diaryText: UILabel!
    @IBOutlet weak var diaryTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.diaryDate.text = dateAsString(date: self.myDiary.date)
        self.diaryText.text = self.myDiary.text
        self.photos = self.myDiary.pictures
        
        self.diaryTableView.delegate = self
        self.diaryTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(photos.count)
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "detailTableCell")
        cell.imageView?.image = UIImage(named: photos[indexPath.row].url)
        print(photos[indexPath.row].url)
        
        return cell
    }
    
    func dateAsString(date: Date) -> String {

        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let str = dateFormatter.string(from: date as Date)
        return str
    }
    
    @IBAction func clossButton(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

