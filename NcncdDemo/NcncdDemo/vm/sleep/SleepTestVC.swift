//
//  SleepTestVC.swift
//  NcncdDemo
//  上传睡眠数据
//  Created by lihaotian on 2017/11/17.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit
import Ncncd

class SleepTestVC: UIViewController, NcncdApiDelegate {
    
    // 总睡眠时长，单位：分
    @IBOutlet weak var tfTotalDuration: UITextField!
    // 有效睡眠时长，单位：分
    @IBOutlet weak var tfEffectiveDuration: UITextField!
    // 深度睡眠时长，单位：分
    @IBOutlet weak var tfDeepDuration: UITextField!
    // 浅睡眠时长，单位：分
    @IBOutlet weak var tfLightDuration: UITextField!
    // 时间间隔
    @IBOutlet weak var tfTime: UITextField!
    
    // 数据内容
    @IBOutlet weak var textView: UITextView!
    
    var datas: Array<Sleep> = []
    
    let httpAlert = MBProgressHUD(view: UIApplication.shared.keyWindow!)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "睡眠数据"
        
        // 修改输入框边框
        textView.layer.borderWidth = 1.5
        textView.layer.borderColor = UIColor.black.cgColor
        
        tfTotalDuration.text = "1000"
        tfEffectiveDuration.text = "1000"
        tfDeepDuration.text = "1000"
        tfLightDuration.text = "100"
        tfTime.text = "6000"
        
        addData(totalDuration: Int(tfTotalDuration.text!)!, effectiveDuration: Int(tfEffectiveDuration.text!)!, deepDuration: Int(tfDeepDuration.text!)!, lightDuration: Int(tfLightDuration.text!)!, time: Int(tfTime.text!)!)
        
    }
    
    /// 添加数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionAdd(_ sender: Any) {
        
        if tfTotalDuration.text!.isEmpty || tfEffectiveDuration.text!.isEmpty || tfDeepDuration.text!.isEmpty || tfLightDuration.text!.isEmpty || tfTime.text!.isEmpty {
            
            showToast(view: self.view, message: "请完整填写内容")
            return
        }
        
        addData(totalDuration: Int(tfTotalDuration.text!)!, effectiveDuration: Int(tfEffectiveDuration.text!)!, deepDuration: Int(tfDeepDuration.text!)!, lightDuration: Int(tfLightDuration.text!)!, time: Int(tfTime.text!)!)
    }
    
    /// 限制输入框长度
    ///
    /// - Parameter sender: sender
    @IBAction func checkTfLength(_ sender: Any) {
        
        setUpTfLength(textF: sender as! UITextField, length: 6)
    }
    
    /// 添加数据
    ///
    /// - Parameters:
    ///   - totalDuration: 总睡眠时长
    ///   - effectiveDuration: 有效睡眠时长
    ///   - deepDuration: 深度睡眠时长
    ///   - lightDuration: 浅睡眠时长
    ///   - time: 时间间隔
    func addData(totalDuration: Int, effectiveDuration: Int, deepDuration: Int, lightDuration: Int, time: Int) {
        
        let sleep = Sleep()
        sleep.totalDuration = totalDuration
        sleep.effectiveDuration = effectiveDuration
        sleep.deepDuration = deepDuration
        sleep.lightDuration = lightDuration
        sleep.beginTime = Int(Date().timeIntervalSince1970) - time
        sleep.endTime = Int(Date().timeIntervalSince1970)
        
        datas.append(sleep)
        
        var text = "总睡眠时长：\(totalDuration) , 有效睡眠时长：\(effectiveDuration) , 深度睡眠时长：\(deepDuration) , 浅睡眠时长：\(lightDuration)"
        if !textView.text.isEmpty {
            
            text.append("\n")
            text.append(textView.text)
        }
        
        textView.text = text
        
    }
    
    /// 上传数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionUpload(_ sender: Any) {
        
        SleepApi.delegate = self
        SleepApi.uploadSleep(data: datas, telephone: "13798765444")
        
    }
    
    /// 重置数据
    ///
    /// - Parameter sender: sender
    @IBAction func actionReset(_ sender: Any) {
        
        textView.text = ""
        
        tfTotalDuration.text = "1000"
        tfEffectiveDuration.text = "1000"
        tfDeepDuration.text = "1000"
        tfLightDuration.text = "100"
        tfTime.text = "6000"
        
        addData(totalDuration: Int(tfTotalDuration.text!)!, effectiveDuration: Int(tfEffectiveDuration.text!)!, deepDuration: Int(tfDeepDuration.text!)!, lightDuration: Int(tfLightDuration.text!)!, time: Int(tfTime.text!)!)
    }
    
    func start() {
        
        httpAlert.label.text = "处理中..."
        UIApplication.shared.keyWindow?.addSubview(httpAlert)
        httpAlert.show(animated: true)
    }
    
    func success() {
        
        showToast(view: self.view, message: "数据上传成功")
        
        textView.text = ""
        
        tfTotalDuration.text = "1000"
        tfEffectiveDuration.text = "1000"
        tfDeepDuration.text = "1000"
        tfLightDuration.text = "100"
        tfTime.text = "6000"
        
        addData(totalDuration: Int(tfTotalDuration.text!)!, effectiveDuration: Int(tfEffectiveDuration.text!)!, deepDuration: Int(tfDeepDuration.text!)!, lightDuration: Int(tfLightDuration.text!)!, time: Int(tfTime.text!)!)
    }
    
    func httpError(httpError: Error) {
        
        showToast(view: self.view, message: "请求异常，请检查您的网络并稍后再试")
    }
    
    func failure(errNo: Int, errMsg: String) {
        
        
        showToast(view: self.view, message: errMsg)
    }
    
    func finish() {
        
        httpAlert.hide(animated: true)
    }
    
    /// 回收键盘
    ///
    /// - Parameters:
    ///   - touches:
    ///   - event:
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
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
