import 'package:petstop/domain/model/product_group.dart';

// ##########
// ## Rabbit
// ##########
class StoreRabbitProductGroup {
  final ProductGroup productGroup;
  StoreRabbitProductGroup(this.productGroup);
}

ProductGroup rabbitProductGroupReducer(ProductGroup prev, action) {
  if (action is StoreRabbitProductGroup) {
    return action.productGroup;
  }

  return prev;
}

// ##########
// ## Dog
// ##########
class StoreDogProductGroup {
  final ProductGroup productGroup;
  StoreDogProductGroup(this.productGroup);
}

ProductGroup dogProductGroupReducer(ProductGroup prev, action) {
  if (action is StoreDogProductGroup) {
    return action.productGroup;
  }

  return prev;
}

