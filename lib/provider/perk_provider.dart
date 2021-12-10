import 'package:team_cost/models/fast_food.dart';
import 'package:team_cost/models/perk.dart';
import 'package:team_cost/models/tasks.dart';
import 'package:team_cost/provider/base_provider.dart';

class PerkProvider extends BaseProvider {
  List<String> fastFoodImages = [
    'images/albertson.png',
    'images/wholeFoods.png',
    'images/kroger.png',
  ];

  List<Task> get taskDetails {
    return <Task>[
      Task(
        body: 'Get 30 interviews from early stage customers',
        percentage: '1.9',
        completed: '27',
        total: '30',
      ),
      Task(
        body: 'Get 30 interviews from early stage customers',
        percentage: '1.9',
        completed: '27',
        total: '30',
      ),
      Task(
        body: 'Get 30 interviews from early stage customers',
        percentage: '1.9',
        completed: '27',
        total: '30',
      )
    ];
  }

  List<FastFood> get fastFoodList {
    return <FastFood>[
      FastFood(
        name: 'Burger King',
        day: 'today',
        price: '81.00',
        image: 'images/burger.png',
      ),
      FastFood(
        name: 'Safeway',
        day: 'yesterday',
        price: '21.00',
        image: 'images/safeway.png',
      ),
    ];
  }

  List<Perk> get perkDeatils {
    return <Perk>[
      Perk(
        image: 'images/leaf.png',
        title: 'Wellness',
        category: 'SERVICE',
        amount: '120.00',
        amountUsed: '54',
      ),
      Perk(
        image: 'images/cut.png',
        title: 'Food & Meals',
        category: 'GROCERY',
        amount: '200.00',
        amountUsed: '91',
      ),
      Perk(
        image: 'images/nus.png',
        title: 'Transport',
        category: 'SERVICE',
        amount: '120.00',
        amountUsed: '29',
      ),
    ];
  }
}
