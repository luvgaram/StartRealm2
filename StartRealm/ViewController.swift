//
//  ViewController.swift
//  StartRealm
//
//  Created by Eunjoo on 2017. 2. 3..
//  Copyright © 2017년 Eunjoo. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var diaries: Results<Diary>!
    var picturesArray = NSMutableArray()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func picOneButton(_ sender: Any) {
        picturesArray.add("01.jpg")
    }

    @IBAction func picTwoButton(_ sender: Any) {
        picturesArray.add("02.jpg")
    }

    @IBAction func picThreeButton(_ sender: Any) {
        picturesArray.add("03.jpg")
    }
    
    @IBAction func picFourButton(_ sender: Any) {
        picturesArray.add("04.jpg")
    }
    
    @IBAction func picFiveButton(_ sender: Any) {
        picturesArray.add("05.jpg")
    }

    @IBAction func picSixButton(_ sender: Any) {
        picturesArray.add("06.jpg")
    }
    
    @IBAction func picSevenButton(_ sender: Any) {
        picturesArray.add("07.jpg")
    }
    
    @IBAction func picEightButton(_ sender: Any) {
        picturesArray.add("08.jpg")
    }
    
    @IBAction func picNineButton(_ sender: Any) {
        picturesArray.add("09.jpg")
    }
    
    @IBAction func picTenButton(_ sender: Any) {
        picturesArray.add("10.jpg")
    }
    
    @IBAction func saveButton(_ sender: Any) {
        // picturesArray 대로 Picture 객체를 만들고 프로퍼티 값을 넣습니다.
        
        let photos = List<Picture>()
        for fileName in picturesArray {
            let picture = Picture()
            picture.url = fileName as! String
            photos.append(picture)
        }
        
        // Diary 객체를 만들고 사용자가 입력한 프로퍼티 값을 넣습니다.
        let myDiary = Diary(value: [incrementID(), Date(), textView.text ?? "", photos]);
        
        // Realm에 Diary 객체를 저장합니다.
        addDiary(diary: myDiary)
        
        // 사용자 입력 정보를 초기화합니다.
        textView.text = ""
        picturesArray = NSMutableArray()
        self.tableView.reloadData()
    }

    func addDiary(diary: Diary) {
        // 기본 Realm을 가져옵니다.
        let realm = try! Realm()
    
        // 트랜잭션 안에서 Realm에 Diary 객체를 추가합니다.
        try! realm.write {
            realm.add(diary)
        }
    }
    
    func readDiary() {
        // 기본 Realm을 가져옵니다.
        let realm = try! Realm()
        
        // 모든 Diary 데이터를 읽습니다. 반환값: Result
        let diaries = realm.objects(Diary.self)
        
        //결과값에 들어있는 각 객체를 읽고 텍스트를 출력합니다.
        for diary in diaries {
            let text = diary.text
            print(text)
        }
    }
    
    // ID 값을 증가시킵니다.
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(Diary.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}

