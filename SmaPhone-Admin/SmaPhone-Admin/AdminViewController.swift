//
//  AdminViewController.swift
//  SmaPhone-Admin
//
//  Created by 会津慎弥 on 2017/05/14.
//  Copyright © 2017年 会津慎弥. All rights reserved.
//

import UIKit
import SocketIO
import SwiftyJSON

class AdminViewController: UIViewController {
    
    private var isSelectedNum = -1
    private var prevButton:UIButton!
    private var songNameArr = ["長谷部","進藤","金田","田島","所沢","鈴木","田代","宮岡","飯田","米田","太田","高田","本田","袴田","新規作成"]
    
    
    var socket = SocketIOClient(socketURL: URL(string: "http://54.250.250.2:5000/websocket")!, config: [.log(true), .forceWebsockets(true), .forcePolling(true)])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        socket.on("connect") {data, ack in
            print("socket connected")
        }
        
        socket.on("disconnect") { data in
            print("socket disconnected!!")
        }
        
        socket.on("start") { data, ack in
            print(data)
        }
        
        self.socket.connect()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendSongName(_ sender: UIButton) {
        if (isSelectedNum != -1) {
            self.socket.emit("start", songNameArr[isSelectedNum - 1])
        }
    }
    
    @IBAction func changeSong(_ sender: UIButton) {
        
        if (isSelectedNum == -1){
            let image:UIImage = UIImage(named:"sumaphoneUI-11.png")!
            isSelectedNum = sender.tag
            prevButton = sender
            sender.setImage(image, for: .normal)
        }else {
            
            if ((prevButton.tag >= 1 && prevButton.tag <= 4) || (prevButton.tag >= 9 && prevButton.tag <= 12)){
                if(prevButton.tag % 2 == 0){
                    let image:UIImage = UIImage(named:"sumaphoneUI-08.png")!
                    prevButton.setImage(image, for: .normal)
                }else {
                    let image:UIImage = UIImage(named:"sumaphoneUI-12.png")!
                    prevButton.setImage(image, for: .normal)
                }
            }else {
                if(prevButton.tag % 2 == 0){
                    let image:UIImage = UIImage(named:"sumaphoneUI-12.png")!
                    prevButton.setImage(image, for: .normal)
                }else {
                    let image:UIImage = UIImage(named:"sumaphoneUI-08.png")!
                    prevButton.setImage(image, for: .normal)
                }
                
            }
            
            let image:UIImage = UIImage(named:"sumaphoneUI-11.png")!
            isSelectedNum = sender.tag
            prevButton = sender
            sender.setImage(image, for: .normal)
        }
    }
    
    @IBAction func beginEdit(_ sender: UIButton) {
        
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
