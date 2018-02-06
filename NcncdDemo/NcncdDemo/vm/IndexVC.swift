//
//  IndexVC.swift
//  NcncdDemo
//  健康信息交互系统Demo首页
//  Created by lihaotian on 2017/11/16.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit
import Ncncd

class IndexVC: UITableViewController, NcncdApiDelegate {
    
    let tabelTitles = ["上传血糖数据","上传健康数据","上传血压数据","上传运动数据","上传睡眠数据","上传血氧数据","上传心率数据","上传体温数据","上传用户数据","上传视力数据","上传胆固醇数据","上传内分泌数据","上传心脑血管数据","上传消化系统数据","上传呼吸系统数据","上传骨骼系统数据","上传免疫数据","上传男性生殖系统数据","上传女性生殖系统数据","上传营养状态数据","上传有害物质数据","上传皮肤数据"]
    
    let vcIdentifiers = ["BloodSugarTestVC", "HealthTestVC", "BloodPressureTestVC", "SportTestVC", "SleepTestVC", "BloodOxygenTestVC", "HeartRateTestVC", "TemperatureTestVC"]
    
    var httpAlert: MBProgressHUD!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        self.title = "NcncdSDK"
        
        httpAlert = MBProgressHUD(view: UIApplication.shared.keyWindow!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.row == 8 {
            
            let bloodSugarTestVC = self.storyboard?.instantiateViewController(withIdentifier: self.vcIdentifiers[indexPath.row])
            self.navigationController?.pushViewController(bloodSugarTestVC!, animated: true)
            
        }else if indexPath.row < 8{
            
            let registerVC = NcncdRegisterVC(nibName: "NcncdBundle.bundle/NcncdRegisterVC", bundle: nil)
            self.navigationController?.pushViewController(registerVC, animated: true)
            
        }else{
            
            switch indexPath.row{
                
            case 9:
                
                let eyesight = Eyesight()
                eyesight.sampleTime = Int(Date().timeIntervalSince1970)
                eyesight.leftEye = Float(arc4random_uniform(50))
                eyesight.rightEye = Float(arc4random_uniform(50))
                
                EyesightApi.delegate = self
                EyesightApi.uploadEyesight(data: [eyesight], telephone: "13889363773")
                
            case 10:
                
                let cholesterol = Cholesterol()
                cholesterol.sampleTime = Int(Date().timeIntervalSince1970)
                cholesterol.uric = Float(arc4random_uniform(50))
                cholesterol.totalCholesterol = Float(arc4random_uniform(50))
                cholesterol.triglycerides = Float(arc4random_uniform(50))
                cholesterol.highDensityProtein = Float(arc4random_uniform(50))
                cholesterol.lowDensityProtein = Float(arc4random_uniform(50))
                
                CholesterolApi.delegate = self
                CholesterolApi.uploadCholesterol(data: [cholesterol], telephone: "13889363773")
                
            case 11:
                
                let endocrine = Endocrine()
                endocrine.sampleTime = Int(Date().timeIntervalSince1970)
                endocrine.insulin = Float(arc4random_uniform(50))
                endocrine.thyroxine = Float(arc4random_uniform(50))
                endocrine.adrenaline = Float(arc4random_uniform(50))
                endocrine.pineal = Float(arc4random_uniform(50))
                
                EndocrineApi.delegate = self
                EndocrineApi.uploadEndocrine(data: [endocrine], telephone: "13889363773")
                
            case 12:
                
                let cardiovascular = Cardiovascular()
                cardiovascular.sampleTime = Int(Date().timeIntervalSince1970)
                cardiovascular.bloodLipid = Float(arc4random_uniform(50))
                cardiovascular.vascularElasticity = Float(arc4random_uniform(50))
                cardiovascular.coronaryElasticity = Float(arc4random_uniform(50))
                cardiovascular.cerebralVascularElasticity = Float(arc4random_uniform(50))
                cardiovascular.brainSupplyBlood = Float(arc4random_uniform(50))
                cardiovascular.myocardialOxygen = Float(arc4random_uniform(50))
                cardiovascular.cholesterolCrystallization = Float(arc4random_uniform(50))
                cardiovascular.heartbeatOutput = Float(arc4random_uniform(50))
                cardiovascular.minuteOutput = Float(arc4random_uniform(50))
                cardiovascular.myocardialBlood = Float(arc4random_uniform(50))
                cardiovascular.vascularResistance = Float(arc4random_uniform(50))
                cardiovascular.pulmonaryArterialPressure = Float(arc4random_uniform(50))
                
                CardiovascularApi.delegate = self
                CardiovascularApi.uploadCardiovascular(data: [cardiovascular], telephone: "13889363773")
                
            case 13:
                
                let digestive = Digestive()
                digestive.sampleTime = Int(Date().timeIntervalSince1970)
                digestive.liverRed = Float(arc4random_uniform(50))
                digestive.liverFat = Float(arc4random_uniform(50))
                digestive.proteinMetabolism = Float(arc4random_uniform(50))
                digestive.gastricPeristalsis = Float(arc4random_uniform(50))
                digestive.gastricAbsorption = Float(arc4random_uniform(50))
                digestive.smallIntestinePeristalsis = Float(arc4random_uniform(50))
                digestive.smallIntestineAbsorption = Float(arc4random_uniform(50))
                
                DigestiveApi.delegate = self
                DigestiveApi.uploadDigestive(data: [digestive], telephone: "13889363773")
                
            case 14:
                
                let respiratory = Respiratory()
                respiratory.sampleTime = Int(Date().timeIntervalSince1970)
                respiratory.capacity = Float(arc4random_uniform(50))
                respiratory.airwayResistance = Float(arc4random_uniform(50))
                
                RespiratoryApi.delegate = self
                RespiratoryApi.uploadRespiratory(data: [respiratory], telephone: "13889363773")
                
            case 15:
                
                let skeletal = Skeletal()
                skeletal.sampleTime = Int(Date().timeIntervalSince1970)
                skeletal.osteoporosis = true
                skeletal.calciumLost = Float(arc4random_uniform(50))
                skeletal.hyperplasia = false
                skeletal.cervicalCalcification = Float(arc4random_uniform(50))
                skeletal.lumbarCalcification = Float(arc4random_uniform(50))
                skeletal.rheumatismCoefficient = Float(arc4random_uniform(50))
                skeletal.ultrasonicSpeed = Float(arc4random_uniform(50))
                skeletal.boneAge = Int(arc4random_uniform(50))
                skeletal.boneDensity = Float(arc4random_uniform(50))
                skeletal.fractureRisk = Float(arc4random_uniform(50))
                
                SkeletalApi.delegate = self
                SkeletalApi.uploadSkeletal(data: [skeletal], telephone: "13889363773")
                
            case 16:
                
                let immune = Immune()
                immune.sampleTime = Int(Date().timeIntervalSince1970)
                immune.lymphIndex = Float(arc4random_uniform(50))
                immune.spleenIndex = Float(arc4random_uniform(50))
                immune.immunoglobulinIndex = Float(arc4random_uniform(50))
                immune.tonsilImmuneIndex = Float(arc4random_uniform(50))
                immune.digestiveImmuneIndex = Float(arc4random_uniform(50))
                immune.respiratoryImmuneIndex = Float(arc4random_uniform(50))
                
                ImmuneApi.delegate = self
                ImmuneApi.uploadImmune(data: [immune], telephone: "13889363773")
                
            case 17:
                
                let maleReproductive = MaleReproductive()
                maleReproductive.sampleTime = Int(Date().timeIntervalSince1970)
                maleReproductive.testosterone = Float(arc4random_uniform(50))
                maleReproductive.erectileConductivity = Float(arc4random_uniform(50))
                maleReproductive.gonadotropin = Float(arc4random_uniform(50))
                maleReproductive.prostateHyperplasia = Float(arc4random_uniform(50))
                maleReproductive.prostatitis = false
                maleReproductive.prostatitisCalcification = Float(arc4random_uniform(50))
                
                MaleReproductiveApi.delegate = self
                MaleReproductiveApi.uploadMaleReproductive(data: [maleReproductive], telephone: "13889363773")
                
            case 18:
                
                let femaleReproductive = FemaleReproductive()
                femaleReproductive.sampleTime = Int(Date().timeIntervalSince1970)
                femaleReproductive.endocrineImbalanceCoefficient = Float(arc4random_uniform(50))
                femaleReproductive.vaginitisCoefficient = Float(arc4random_uniform(50))
                femaleReproductive.adnexitisCoefficient = Float(arc4random_uniform(50))
                
                FemaleReproductiveApi.delegate = self
                FemaleReproductiveApi.uploadFemaleReproductive(data: [femaleReproductive], telephone: "13889363773")
                
            case 19:
                
                let nutritional = Nutritional()
                nutritional.sampleTime = Int(Date().timeIntervalSince1970)
                nutritional.vitaminE = Float(arc4random_uniform(50))
                nutritional.vitaminD3 = Float(arc4random_uniform(50))
                nutritional.vitaminA = Float(arc4random_uniform(50))
                nutritional.vitaminC = Float(arc4random_uniform(50))
                nutritional.vitaminK = Float(arc4random_uniform(50))
                nutritional.vitaminB12 = Float(arc4random_uniform(50))
                nutritional.vitaminB1 = Float(arc4random_uniform(50))
                nutritional.vitaminB2 = Float(arc4random_uniform(50))
                nutritional.vitaminB3 = Float(arc4random_uniform(50))
                nutritional.vitaminB6 = Float(arc4random_uniform(50))
                nutritional.calcium = Float(arc4random_uniform(50))
                nutritional.iron = Float(arc4random_uniform(50))
                nutritional.selenium = Float(arc4random_uniform(50))
                nutritional.zinc = Float(arc4random_uniform(50))
                nutritional.folate = Float(arc4random_uniform(50))
                nutritional.coenzymeQ10 = Float(arc4random_uniform(50))
                nutritional.amino = Float(arc4random_uniform(50))
                
                NutritionalApi.delegate = self
                NutritionalApi.uploadNutritional(data: [nutritional], telephone: "13889363773")
                
            case 20:
                
                let harmfulSubstances = HarmfulSubstances()
                harmfulSubstances.sampleTime = Int(Date().timeIntervalSince1970)
                harmfulSubstances.heavyMetal = Float(arc4random_uniform(50))
                harmfulSubstances.pb = Float(arc4random_uniform(50))
                harmfulSubstances.mercury = Float(arc4random_uniform(50))
                harmfulSubstances.arsenic = Float(arc4random_uniform(50))
                harmfulSubstances.electronicRadiation = Float(arc4random_uniform(50))
                harmfulSubstances.pesticideResidues = Float(arc4random_uniform(50))
                
                HarmfulSubstancesApi.delegate = self
                HarmfulSubstancesApi.uploadHarmfulSubstances(data: [harmfulSubstances], telephone: "13889363773")
                
            case 21:
                
                let skin = Skin()
                skin.sampleTime = Int(Date().timeIntervalSince1970)
                skin.collagenIndex = Float(arc4random_uniform(50))
                skin.oilIndex = Float(arc4random_uniform(50))
                skin.moistureIndex = Float(arc4random_uniform(50))
                skin.keratinIndex = Float(arc4random_uniform(50))
                
                SkinApi.delegate = self
                SkinApi.uploadSkin(data: [skin], telephone: "13889363773")
                
            default:
                
                print("error")
                
            }
            
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tabelTitles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //在重用机制里取出cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = tabelTitles[indexPath.row]
        
        return cell
    }
    
    func start() {
        
        httpAlert.label.text = "处理中..."
        UIApplication.shared.keyWindow?.addSubview(httpAlert)
        httpAlert.show(animated: true)
    }
    
    func success() {
        
        showToast(view: self.view, message: "数据上传成功")
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
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
