$(document).ready(function(){

  $('#calculatorlist').on('click', 'button', function(){
    var buttonName = $(this).attr('name');
    var originalTotalWeight = parseFloat($('#weight-total').text());
    console.log("originalTotalWeight is " + originalTotalWeight);
    var unit_weights_in_grams = {
      // plastic
      'plastic-drink-bottle': 1.0,
      'plastic-food-container': 1.0,
      'laundry-detergent-bottle': 1.0,
      'gallon-milk-jug': 1.0,

      // metal
      'aluminum-beverage-can': 1.0,
      'tin-or-steel-food-can': 1.0,

      // glass
      'glass-jar-or-bottle': 1.0,
      'large-glass-bottle': 1.0,

      // paper
      'newspaper': 1.0,
      'magazine': 1.0,
      'junk-mail': 1.0,
      'stack-of-ten-pages-of-office-paper': 1.0,
      'cardboard-box': 1.0,
      'telephone-book': 1.0,
      'paper-bag': 1.0,
      'cereal-box': 1.0,
      'paper-towel-roll': 1.0
    }; // end of weights object

    console.log("clicked the " + buttonName + " button, corresponding to a weight of " + unit_weights_in_grams[buttonName]);

    var newTotalWeight = originalTotalWeight + unit_weights_in_grams[buttonName]
    console.log("newTotalWeight is " + newTotalWeight);
    $('#weight-total').text(newTotalWeight);
  }); //end of button selector
}); //end of doc ready
