
var dueDateNeeded = function(){
  $('#workout_user_id').change(function(){
    if($('#workout_user_id').val() > 0){
      if($('#due_date').css('display') === 'none'){
        $('#due_date').animate({
          height: "toggle",
          opacity: 1
        }, 150)
      }
    }else{
      if($('#due_date').css('display') !== 'none'){
        $('#due_date').animate({
          height: "toggle",
          opacity: 1
        }, 150, function(){
          $('#workout_due_date').val('')
        })
      }
    }
  })

}

var dueDateOnPageLoad = function(){
  if($('#workout_user_id').val() > 0){
    $('#due_date').css('display', 'block');
  }


}

var dueDateOnEdit = function(){
  if($('#workout_user_id').length === 0){
    $('#due_date').css('display', 'block');
  }
}


var changeWeightField = function(selector){
  selector.change(function(){
    selector.parent().parent().children().find('.distance_entry').val('');
    selector.parent().parent().children().find('.interval_entry').val('');
  })
}

var changeDistanceField = function(selector){
  selector.change(function(){
    selector.parent().parent().children().find('.weight_entry').val('');
    selector.parent().parent().children().find('.interval_entry').val('');
  })
}

var changeIntervalField = function(selector){
  selector.change(function(){
    selector.parent().parent().children().find('.distance_entry').val('');
    selector.parent().parent().children().find('.weight_entry').val('');
  })
}






$(function() {

    $( ".datepicker" ).datepicker({
      changeMonth: true,
      changeYear: true,
      dateFormat: "yy-mm-dd",
    });

  var initialWeightFields = $('.weight_entry');
  for(var i =0; i < initialWeightFields.length; i++){
    changeWeightField(initialWeightFields.eq(i))
  }

  var initialDistanceFields = $('.distance_entry');
  for(var i =0; i < initialDistanceFields.length; i++){
    changeDistanceField(initialDistanceFields.eq(i))
  }

  var initialIntervalFields = $('.interval_entry');
  for(var i =0; i < initialIntervalFields.length; i++){
    changeIntervalField(initialIntervalFields.eq(i))
  }


  $(document).on('nested:fieldAdded', function(event){
    var weightSelector = event.field.find('.weight_entry');
    var distanceSelector = event.field.find('.distance_entry');
    var intervalSelector = event.field.find('.interval_entry');
    changeWeightField(weightSelector);
    changeIntervalField(intervalSelector);
    changeDistanceField(distanceSelector);
  })

   dueDateNeeded();
   dueDateOnPageLoad();
   dueDateOnEdit();
});