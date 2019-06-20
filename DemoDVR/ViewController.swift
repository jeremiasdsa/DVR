//
//  ViewController.swift
//  DemoDVR
//
//  Created by jeremias on 6/17/19.
//  Copyright © 2019 virtus. All rights reserved.
//

import UIKit
import EZOpenSDKFramework

class ViewController: UIViewController {
    @IBOutlet weak var viewPlayer: UIView!
    @IBOutlet weak var viewPlayer2: UIView!
    @IBOutlet weak var viewPlayer3: UIView!
    @IBOutlet weak var viewPlayer4: UIView!
    @IBOutlet weak var viewPlayer5: UIView!
    @IBOutlet weak var viewPlayer6: UIView!
    @IBOutlet weak var viewPlayer7: UIView!
    @IBOutlet weak var viewPlayer8: UIView!
    @IBOutlet weak var viewPlayer9: UIView!
    @IBOutlet weak var viewPlayer10: UIView!
    @IBOutlet weak var viewPlayer11: UIView!
    @IBOutlet weak var viewPlayer12: UIView!
    @IBOutlet weak var viewPlayer13: UIView!
    @IBOutlet weak var viewPlayer14: UIView!
    @IBOutlet weak var viewPlayer15: UIView!
    @IBOutlet weak var viewPlayer16: UIView!
    
    @IBOutlet weak var lbCameraNo: UITextField!
    


    var player: EZPlayer = EZPlayer()
     var player2: EZPlayer = EZPlayer()
     var player3: EZPlayer = EZPlayer()
    var player4: EZPlayer = EZPlayer()
     var player5: EZPlayer = EZPlayer()
     var player6: EZPlayer = EZPlayer()
     var player7: EZPlayer = EZPlayer()
     var player8: EZPlayer = EZPlayer()
     var player9: EZPlayer = EZPlayer()
     var player10: EZPlayer = EZPlayer()
     var player11: EZPlayer = EZPlayer()
     var player12: EZPlayer = EZPlayer()
     var player13: EZPlayer = EZPlayer()
     var player14: EZPlayer = EZPlayer()
     var player15: EZPlayer = EZPlayer()
     var player16: EZPlayer = EZPlayer()


    override func viewDidLoad() {
        super.viewDidLoad()
//        EZOpenSDK.setDebugLogEnable(true)
//        EZOpenSDK.initLib(withAppKey: appKey)
        
        EZGlobalSDK.setDebugLogEnable(true)
        EZGlobalSDK.initLib(withAppKey: appKey)
       // self.setDomain()
    }

    private func setDomain() {
        EZGlobalSDK.setHiddnsDomain(deviceSerial, domain: domain) { erro in
            if erro != nil {
                print("ERROR: setDomain >> \(erro)")
            } else {
                print("SUCCESS: setDomain")
            }
        }
    }


    @IBAction func loginPressed(_ sender: Any) {
        print("ConnectPressed")
        
        if GLOBAL {
            // No sucesso do Alamofire adicionar esse token
            EZGlobalSDK.setAccessToken(self.accessToken)
            print("login GlobalSDK")
        } else {
            EZOpenSDK.setAccessToken(self.accessToken)
             print("login OpenSDK")
        }
    }
    
    @IBAction func addDevicePressed(_ sender: Any) {
         print("ADD DEVICE")
        if GLOBAL {
            EZGlobalSDK.addDevice(self.deviceSerial, verifyCode: self.verifyCode) { erro in
                if erro != nil {
                    print("ERROR: addDevicePressed GlobalSDK>> \(erro)")
                } else {
                    print("SUCCESS: addDevicePressed GlobalSDK")
                }
            }
        } else {
            EZOpenSDK.addDevice(self.deviceSerial, verifyCode: self.verifyCode) { erro in
                if erro != nil {
                    print("ERROR: addDevicePressed OpenSDK>> \(erro)")
                } else {
                    print("SUCCESS: addDevicePressed OpenSDK")
                }
            }
        }
        
    }

    
    
    @IBAction func createPlayerPressed(_ sender: Any) {
        print("CREATE PLAYER")
        
//        if let cameraNo = self.lbCameraNo.text {
//            self.cameraNo = Int(cameraNo)!
//        }
        
        if GLOBAL {
            self.player = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 1)
            self.player2 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 2)
            self.player3 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 3)
            self.player4 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 4)
            self.player5 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 5)
            self.player6 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 6)
            self.player7 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 7)
            self.player8 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 8)
            self.player9 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 9)
            self.player10 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 10)
            self.player11 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 11)
            self.player12 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 12)
            self.player13 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 13)
            self.player14 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 14)
            self.player15 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 15)
            self.player16 = EZGlobalSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: 16)
            print("Player created with GlobalSDK camera \(self.cameraNo)")
        } else {
            self.player = EZOpenSDK.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: self.cameraNo)
            print("Player created with OpenSDK camera \(self.cameraNo)")
        }
        
        //self.player = EZPlayer.createPlayer(withDeviceSerial: self.deviceSerial, cameraNo: self.cameraNo)
        self.player.delegate = self
        self.player2.delegate = self
        self.player3.delegate = self
        self.player4.delegate = self
        self.player5.delegate = self
        self.player6.delegate = self
        self.player7.delegate = self
        self.player8.delegate = self
        self.player9.delegate = self
        self.player10.delegate = self
        self.player11.delegate = self
        self.player12.delegate = self
        self.player13.delegate = self
        self.player14.delegate = self
        self.player15.delegate = self
        self.player16.delegate = self
        
        self.player.setPlayerView(self.viewPlayer)
        self.player2.setPlayerView(self.viewPlayer2)
        self.player3.setPlayerView(self.viewPlayer3)
        self.player4.setPlayerView(self.viewPlayer4)
        self.player5.setPlayerView(self.viewPlayer5)
        self.player6.setPlayerView(self.viewPlayer6)
        self.player7.setPlayerView(self.viewPlayer7)
        self.player8.setPlayerView(self.viewPlayer8)
        self.player9.setPlayerView(self.viewPlayer9)
        self.player10.setPlayerView(self.viewPlayer10)
        self.player11.setPlayerView(self.viewPlayer11)
        self.player12.setPlayerView(self.viewPlayer12)
        self.player13.setPlayerView(self.viewPlayer13)
        self.player14.setPlayerView(self.viewPlayer14)
        self.player15.setPlayerView(self.viewPlayer15)
        self.player16.setPlayerView(self.viewPlayer16)
        
//        self.player.setPlayVerifyCode(self.verifyCode)
        

    }
    
    
    
    @IBAction func playPressed(_ sender: Any) {
        print("PLAY")
        self.player.startRealPlay()
        self.player2.startRealPlay()
        self.player3.startRealPlay()
        self.player4.startRealPlay()
        self.player5.startRealPlay()
        self.player6.startRealPlay()
        self.player7.startRealPlay()
        self.player8.startRealPlay()
        self.player9.startRealPlay()
        self.player10.startRealPlay()
        self.player11.startRealPlay()
        self.player12.startRealPlay()
        self.player13.startRealPlay()
        self.player14.startRealPlay()
        self.player15.startRealPlay()
        self.player16.startRealPlay()
        
        
        
        
    }
    
    @IBAction func stopPressed(_ sender: Any) {
        print("STOP")
        self.player.stopRealPlay()
        self.player2.stopRealPlay()
        self.player3.stopRealPlay()
        self.player4.stopRealPlay()
        self.player5.stopRealPlay()
        self.player6.stopRealPlay()
        self.player7.stopRealPlay()
        self.player8.stopRealPlay()
        self.player9.stopRealPlay()
        self.player10.stopRealPlay()
        self.player11.stopRealPlay()
        self.player12.stopRealPlay()
        self.player13.stopRealPlay()
        self.player14.stopRealPlay()
        self.player15.stopRealPlay()
        self.player16.stopRealPlay()
    }
    
    @IBAction func removePressed(_ sender: Any) {
        print("REMOVE")
        
        if GLOBAL {
            EZGlobalSDK.deleteDevice(self.deviceSerial) { erro in
                if erro != nil {
                    print("ERROR: removeDevice GlobalSDK>> \(erro)")
                } else {
                    print("SUCCESS: removeDevice GlobalSDK")
                }
            }
        } else {
            EZOpenSDK.deleteDevice(self.deviceSerial) { erro in
                if erro != nil {
                    print("ERROR: removeDevice OpenSDK>> \(erro)")
                } else {
                    print("SUCCESS: removeDevice OpenSDK")
                }
            }
        }

    }
    
    
    @IBAction func logoutPressed(_ sender: Any) {
        print("LOGOUT")
        
        if GLOBAL {
            EZGlobalSDK.logout { erro in
                if erro != nil {
                    print("ERROR: logout GlobalSDK>> \(erro)")
                } else {
                    print("SUCCESS: logout GlobalSDK")
                }
            }
        } else {
            EZOpenSDK.logout { erro in
                if erro != nil {
                    print("ERROR: logout OpenSDK>> \(erro)")
                } else {
                    print("SUCCESS: logout OpenSDK")
                }
            }
        }
    }
}




extension ViewController: EZPlayerDelegate {
    
    func player(_ player: EZPlayer!, didPlayFailed error: Error!) {
        print("didPlayFailed")
    }
    
    func player(_ player: EZPlayer!, didReceivedMessage messageCode: Int) {
        print("didReceivedMessage")
    }
    
    func player(_ player: EZPlayer!, didReceivedDataLength dataLength: Int) {
        print("didReceivedDataLength")
    }
    
    func player(_ player: EZPlayer!, didReceivedDisplayHeight height: Int, displayWidth width: Int) {
        print("didReceivedDisplayHeight")
    }

}


