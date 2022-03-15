//
//  GenerateData.swift
//  DodoLayout
//
//  Created by Владимир Юшков on 18.02.2022.
//

import UIKit

struct DataGenerator {
    
    func menuItems() -> [MenuItem] {
        let temp = [MenuItem(foodKind: .pizza, itemName: "Neapolitan Pizza",
                             caption: "Facto molestiam, quod metuo, ne a perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio.",
                             price: 450, image: UIImage(named: "pizza1")!),
                    MenuItem(foodKind: .pizza, itemName: "Chicago Pizza",
                             caption: "Sed anxietate illa et quasi morositate disputationis praetermissa genus ipsum rei tantum paucis verbis notavit.",
                             price: 380, image: UIImage(named: "pizza2")!),
                    MenuItem(foodKind: .pizza, itemName: "Sicilian Pizza",
                             caption: "Perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio, quod mihi optimum factu duxerim.",
                             price: 520, image: UIImage(named: "pizza3")!),
                    MenuItem(foodKind: .pizza, itemName: "Greek Pizza",
                             caption: "Theophrasto disputatur, viro in philosophia peripatetica modestissimo doctissimoque, eaque disputatio scripta est, si recte meminimus, in libro eius de amicitia primo.",
                             price: 450, image: UIImage(named: "pizza4")!),
                    MenuItem(foodKind: .pizza, itemName: "St. Louis Pizza",
                             caption: "Sic mihi et iudicis et amici officium in re tanta salvum fuit. Diversum eius aliis suasisse.",
                             price: 420, image: UIImage(named: "pizza5")!),
                    MenuItem(foodKind: .pizza, itemName: "Detroit Pizza",
                             caption: "Quid autem refert scire me in eiusmodi periculis amicorum, si non magna me turpitudo insecutura est, de via esse recta declinandum, nisi id quoque me docuerit, quam putet magnam turpitudinem, et cum decessero de via.",
                             price: 380, image: UIImage(named: "pizza6")!),
                    
                    MenuItem(foodKind: .burger, itemName: "Le Pigeon Burger",
                             caption: "Facto molestiam, quod metuo, ne a perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio.",
                             price: 280, image: UIImage(named: "burger1")!),
                    MenuItem(foodKind: .burger, itemName: "The Company Burger",
                             caption: "Sed anxietate illa et quasi morositate disputationis praetermissa genus ipsum rei tantum paucis verbis notavit.",
                             price: 510, image: UIImage(named: "burger2")!),
                    MenuItem(foodKind: .burger, itemName: "Chargrilled Burger",
                             caption: "Perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio, quod mihi optimum factu duxerim.",
                             price: 420, image: UIImage(named: "burger3")!),
                    MenuItem(foodKind: .burger, itemName: "Dyer’s Deep-Fried Burger",
                             caption: "Theophrasto disputatur, viro in philosophia peripatetica modestissimo doctissimoque, eaque disputatio scripta est, si recte meminimus, in libro eius de amicitia primo.",
                             price: 460, image: UIImage(named: "burger4")!),
                    MenuItem(foodKind: .burger, itemName: "Double Patty Cheeseburger",
                             caption: "Sic mihi et iudicis et amici officium in re tanta salvum fuit. Diversum eius aliis suasisse.",
                             price: 320, image: UIImage(named: "burger5")!),
                    
                    MenuItem(foodKind: .appetizer, itemName: "Antipasto",
                             caption: "Facto molestiam, quod metuo, ne a perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio.",
                             price: 340, image: UIImage(named: "appetizer1")!),
                    MenuItem(foodKind: .appetizer, itemName: "Meze",
                             caption: "Sed anxietate illa et quasi morositate disputationis praetermissa genus ipsum rei tantum paucis verbis notavit.",
                             price: 210, image: UIImage(named: "appetizer2")!),
                    MenuItem(foodKind: .appetizer, itemName: "Tapa",
                             caption: "Perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio, quod mihi optimum factu duxerim.",
                             price: 190, image: UIImage(named: "appetizer3")!),
                    MenuItem(foodKind: .appetizer, itemName: "Charcuterie",
                             caption: "Theophrasto disputatur, viro in philosophia peripatetica modestissimo doctissimoque, eaque disputatio scripta est, si recte meminimus, in libro eius de amicitia primo.",
                             price: 160, image: UIImage(named: "appetizer4")!),
                    MenuItem(foodKind: .appetizer, itemName: "Crudités",
                             caption: "Sic mihi et iudicis et amici officium in re tanta salvum fuit. Diversum eius aliis suasisse.",
                             price: 320, image: UIImage(named: "appetizer5")!),
                    MenuItem(foodKind: .appetizer, itemName: "Smørrebrød",
                             caption: "Sic mihi et iudicis et amici officium in re tanta salvum fuit. Diversum eius aliis suasisse.",
                             price: 250, image: UIImage(named: "appetizer6")!),
                    
                    MenuItem(foodKind: .sauces, itemName: "Hot Sauce",
                             caption: "Facto molestiam, quod metuo, ne a perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio.",
                             price: 230, image: UIImage(named: "sauce1")!),
                    MenuItem(foodKind: .sauces, itemName: "Tomato Sauce",
                             caption: "Sed anxietate illa et quasi morositate disputationis praetermissa genus ipsum rei tantum paucis verbis notavit.",
                             price: 210, image: UIImage(named: "sauce2")!),
                    MenuItem(foodKind: .sauces, itemName: "Taco Sauce",
                             caption: "Perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio, quod mihi optimum factu duxerim.",
                             price: 390, image: UIImage(named: "sauce3")!),
                    MenuItem(foodKind: .sauces, itemName: "Barbecue Sauce",
                             caption: "Theophrasto disputatur, viro in philosophia peripatetica modestissimo doctissimoque, eaque disputatio scripta est, si recte meminimus, in libro eius de amicitia primo.",
                             price: 190, image: UIImage(named: "sauce4")!),
                    
                    MenuItem(foodKind: .beverage, itemName: "Cappuccino",
                             caption: "Facto molestiam, quod metuo, ne a perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio.",
                             price: 340, image: UIImage(named: "beverage1")!),
                    MenuItem(foodKind: .beverage, itemName: "Hot chocolate",
                             caption: "Sed anxietate illa et quasi morositate disputationis praetermissa genus ipsum rei tantum paucis verbis notavit.",
                             price: 210, image: UIImage(named: "beverage2")!),
                    MenuItem(foodKind: .beverage, itemName: "Orange juice",
                             caption: "Perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio, quod mihi optimum factu duxerim.",
                             price: 190, image: UIImage(named: "beverage3")!),
                    MenuItem(foodKind: .beverage, itemName: "Fruit juice",
                             caption: "Theophrasto disputatur, viro in philosophia peripatetica modestissimo doctissimoque, eaque disputatio scripta est, si recte meminimus, in libro eius de amicitia primo.",
                             price: 160, image: UIImage(named: "beverage4")!),
                    MenuItem(foodKind: .beverage, itemName: "Milkshake",
                             caption: "Sic mihi et iudicis et amici officium in re tanta salvum fuit. Diversum eius aliis suasisse.",
                             price: 320, image: UIImage(named: "beverage5")!),
                    MenuItem(foodKind: .beverage, itemName: "Smoothie",
                             caption: "Sic mihi et iudicis et amici officium in re tanta salvum fuit. Diversum eius aliis suasisse.",
                             price: 250, image: UIImage(named: "beverage6")!),
                    MenuItem(foodKind: .beverage, itemName: "Lit Irishman Delight",
                             caption: "Sic mihi et iudicis et amici officium in re tanta salvum fuit. Diversum eius aliis suasisse.",
                             price: 250, image: UIImage(named: "beverage7")!),
                    
                    MenuItem(foodKind: .dessert, itemName: "Chocolate mousse",
                             caption: "Facto molestiam, quod metuo, ne a perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio.",
                             price: 160, image: UIImage(named: "dessert1")!),
                    MenuItem(foodKind: .dessert, itemName: "Roasted strawberry crumble",
                             caption: "Sed anxietate illa et quasi morositate disputationis praetermissa genus ipsum rei tantum paucis verbis notavit.",
                             price: 310, image: UIImage(named: "dessert2")!),
                    MenuItem(foodKind: .dessert, itemName: "Tiramisu",
                             caption: "Perfidia et culpa non abhorreat in eadem re eodemque tempore inque communi negotio, quod mihi optimum factu duxerim.",
                             price: 190, image: UIImage(named: "dessert3")!),
                    MenuItem(foodKind: .dessert, itemName: "Kardinalschnitten",
                             caption: "Theophrasto disputatur, viro in philosophia peripatetica modestissimo doctissimoque, eaque disputatio scripta est, si recte meminimus, in libro eius de amicitia primo.",
                             price: 290, image: UIImage(named: "dessert4")!)
                    
        ]
        
        return temp
    }
}
