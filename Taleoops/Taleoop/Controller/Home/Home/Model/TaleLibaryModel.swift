
import UIKit

class TaleLibaryModel: TaleBaseModel {
    internal var data:[TaleLibaryListModel]?
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "data" {
            var arryData = [TaleLibaryListModel]()
            for valueMember in value as! [Any]{
                arryData.append(TaleLibaryListModel(valueMember))
            }
            self.data = arryData
        } else
        {
            super.setValue(value, forKey: key)
        }
    }
}
class TaleLibaryListModel: TaleBaseModel {
    internal var nameInage:String?
        
}
