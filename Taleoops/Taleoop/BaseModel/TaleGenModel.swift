
import UIKit

class NetworkModel:TaleBaseModel {
    var herpes:Int = -1
    var porphyrize:String?
}
class TaleGenModel: TaleBaseModel {
    var koa:String?
        
    var anglist:String?
        
    var yamal:String?
        
    var grievant:Bool = false
        
    var klavern:Bool = false
    var vs:String?
    var utah:String?
        
    var piston:Int = 0
    var radially:Bool = false
        
        
    var groupware:String?
    var passiontide:Int = 0
    var chylomicron:Int = 0
        
    var waterspout:String?
    var dioestrous:String?
    var uncus:Int = 0
    var tertschite:Int = 0
    var sheathy:Bool = false
    var delimiter:Bool = false
    var photosurface:Int = 0
    var finnish:Int = 0
    var overworn:Int = 0
    var uniovular:CGFloat = 0
    var letterman:[Any]?
        
    var comment:String?
        
}



class TaleMonicaModel: TaleBaseModel {
    var chylomicron:Int = 0
    var ramiform:String?
        
}
class TaleCommoditiesModel: TaleBaseModel {
    var wedded:Int = 0
    var uniovular:CGFloat = 0
        
    var crabbed:[TaleCommoditiesListModel]?
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "crabbed" {
            var arryData = [TaleCommoditiesListModel]()
            for valueMember in value as! [Any]{
                arryData.append(TaleCommoditiesListModel(valueMember))
                self.crabbed = arryData
            }
        } else{
            super.setValue(value, forKey: key)
        }
    }
}
class TaleCommoditiesListModel: TaleBaseModel {
    var nomadic:Int = 0
    var chylomicron:Int = 0
    var ishmaelite:CGFloat = 0
}

class TaleBeModel: TaleBaseModel {
    var bailer:String?
    var chylomicron:Int = 0
    var tailgunning:String?
    var avow:[TaleGenModel]?
    var serbia:[TaleGenModel]?
    var copilot:Int = 0
    var chevroler:String?
    var ochrea:String?
    var chernozem:String?
    var fogrum:String?
    var disavowal:String?
    var cuddy:String?
    var pastille:String?
    var polarisable:String?
    var phytopathogen:String?
    var autoland:String?
    var stretcher:[Any]?
    var fatalistic:[TaleGenModel]?
    var unengaged:[TaleGenModel]?
    var trilobal:Int = 0
    var desalinization:Int = 0
    var citrullin:Int = 0
    var antemundane:String?
    var importance:TaleGenModel?
        
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "fatalistic" {
            if IsNilStr((value as! String)){
                self.fatalistic = []
            }else{
                let ary = getJson(value as! String)
                var arryData = [TaleGenModel]()
                if ary != nil {
                    for valueMember in ary!{
                        arryData.append(TaleGenModel(valueMember))
                    }
                    self.fatalistic = arryData
                }
            }
        }else if key == "unengaged" {
            if IsNilStr((value as! String)){
                self.unengaged = []
            }else{
                let ary = getJson(value as! String)
                var arryData = [TaleGenModel]()
                if ary != nil {
                    for valueMember in ary!{
                        arryData.append(TaleGenModel(valueMember))
                    }
                    self.unengaged = arryData
                }
            }
        }else if key == "serbia" {
            if IsNilStr((value as! String)){
                self.serbia = []
            }else{
                let ary = getJson(value as! String)
                var arryData = [TaleGenModel]()
                if ary != nil {
                    for valueMember in ary!{
                        arryData.append(TaleGenModel(valueMember))
                    }
                    self.serbia = arryData
                }
            }
        }else if key == "avow" {
            if IsNilStr((value as! String)){
                self.avow = []
            }else{
                let ary = getJson(value as! String)
                var arryData = [TaleGenModel]()
                if ary != nil {
                    for valueMember in ary!{
                        arryData.append(TaleGenModel(valueMember))
                    }
                    self.avow = arryData
                }
            }
        }else if key == "importance" {
            self.importance = TaleGenModel(value ?? TaleGenModel())
        }else if key == "stretcher" {
            if IsNilStr((value as! String)) {
                self.stretcher = []
            }else{
                self.stretcher = RotateJson(value as! String)
            }
        } else{
            super.setValue(value, forKey: key)
        }
    }
}

class TaleBeListModel: TaleBaseModel {
    var herpes:Int = 0
    var porphyrize:String?
    var armonica:[TaleBeModel]?
        
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "armonica" {
            var arryData = [TaleBeModel]()
            for valueMember in value as! [Any]{
                arryData.append(TaleBeModel(valueMember))
            }
            self.armonica = arryData
        } else{
            super.setValue(value, forKey: key)
        }
    }
        
}
class TaleUserModel: TaleBaseModel {
    var herpes:Int = 0
    var porphyrize:String?
    var armonica:[TaleGenModel]?
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "armonica" {
            var arryData = [TaleGenModel]()
            for valueMember in value as! [Any]{
                arryData.append(TaleGenModel(valueMember))
            }
            self.armonica = arryData
        } else{
            super.setValue(value, forKey: key)
        }
    }
}
