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

    override func viewDidLoad() {
        super.viewDidLoad()
        addDiary()
    }
    
    func addDiary() {
        // 기본 Realm을 가져옵니다.
        let realm = try! Realm()
        
        // Picture 객체를 만들고 값을 넣습니다.
        let testPicture1 = Picture(value:["01.jpg"])
        let testPicture2 = Picture(value:["02.jpg"])
        
        // Diary 객체를 만들고 값을 넣습니다.
        let myDiary = Diary(value: [incrementID(), Date(), "안녕하세요?", [testPicture1, testPicture2]]);
        
        // 트랜잭션 안에서 Realm에 Diary 객체를 추가합니다.
        try! realm.write {
            realm.add(myDiary)
        }
        
        // Realm 경로를 찾습니다.
        print(Realm.Configuration.defaultConfiguration.fileURL!)
    }
    
    // ID 값을 증가시킵니다.
    func incrementID() -> Int {
        let realm = try! Realm()
        return (realm.objects(Diary.self).max(ofProperty: "id") as Int? ?? 0) + 1
    }
}

