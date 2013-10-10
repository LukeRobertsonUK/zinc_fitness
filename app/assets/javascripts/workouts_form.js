var weightsNeeded = function(selector){
  selector.change(function(){
    if(selector.val() === "false"){
      selector.parent().parent().children('.weight_input_box').fadeOut(150, function(){
        selector.parent().parent().children().find('.four_digit_entry').val('');
      })
    }else{
      selector.parent().parent().children('.weight_input_box').fadeIn(150);
    }
  })
}

var setTypeChange = function(selector){
  selector.change(function() {


  if(selector.val() === "Distance"){


    if(selector.parent().parent().children('.resistance_fields').css('display') !== 'none'){
      selector.parent().parent().children('.resistance_fields').animate({
         height: "toggle",
          opacity: 1
      }, 150, function(){
        selector.parent().parent().children('.resistance_fields').find('.exercise_selector').val('false');
        selector.parent().parent().children('.resistance_fields').find('.four_digit_entry').val('');

      })
    }

    if(selector.parent().parent().children('.cardio_fields').css('display') === 'none'){
      selector.parent().parent().children('.cardio_fields').animate({
        height: "toggle",
        opacity: 1
      }, 150, function(){
        selector.parent().parent().children('.cardio_fields').children('.distance').fadeIn(150)
      })
    }else{

        selector.parent().parent().children('.cardio_fields').children('.interval').fadeOut(150, function(){
              selector.parent().parent().children('.cardio_fields').children('.interval').find('.four_digit_entry').val('');
              selector.parent().parent().children('.cardio_fields').children('.distance').fadeIn(150);
            }
          );
    }
   }


   if(selector.val() === "Time Interval"){


    if(selector.parent().parent().children('.resistance_fields').css('display') !== 'none'){
      selector.parent().parent().children('.resistance_fields').animate({
         height: "toggle",
          opacity: 1
      }, 150, function(){
        selector.parent().parent().children('.resistance_fields').find('.exercise_selector').val('false');
        selector.parent().parent().children('.resistance_fields').find('.four_digit_entry').val('');
      })
    }

    if(selector.parent().parent().children('.cardio_fields').css('display') === 'none'){
      selector.parent().parent().children('.cardio_fields').animate({
        height: "toggle",
        opacity: 1
      }, 150, function(){
        selector.parent().parent().children('.cardio_fields').children('.interval').fadeIn(150)
      })
    }else{

        selector.parent().parent().children('.cardio_fields').children('.distance').fadeOut(150, function(){
          selector.parent().parent().children('.cardio_fields').children('.distance').find('.four_digit_entry').val('');
          selector.parent().parent().children('.cardio_fields').children('.interval').fadeIn(150);
        });

    }
   }

  if(selector.val() === "Resistance"){


    if(selector.parent().parent().children('.cardio_fields').css('display') !== 'none'){
      selector.parent().parent().children('.cardio_fields').animate({
        height: "toggle",
        opacity: 1
      }, 150, function(){
        selector.parent().parent().children('.cardio_fields').children('.distance').css({display: 'none'});
        selector.parent().parent().children('.cardio_fields').children('.distance').find('.four_digit_entry').val('');
        selector.parent().parent().children('.cardio_fields').children('.interval').css({display: 'none'});
        selector.parent().parent().children('.cardio_fields').children('.interval').find('.four_digit_entry').val('');
      })
    }

    if(selector.parent().parent().children('.resistance_fields').css('display') === 'none'){
      selector.parent().parent().children('.resistance_fields').animate({
        height: "toggle",
        opacity: 1
      }, 150)
    }

   }

  if(selector.val() === ""){


    if(selector.parent().parent().children('.resistance_fields').css('display') !== 'none'){
      selector.parent().parent().children('.resistance_fields').animate({
        height: "toggle",
        opacity: 1
      }, 150, function(){
        selector.parent().parent().children('.resistance_fields').find('.exercise_selector').val('false');
        selector.parent().parent().children('.resistance_fields').find('.four_digit_entry').val('');

      })
    };

     if(selector.parent().parent().children('.cardio_fields').css('display') !== 'none'){
      selector.parent().parent().children('.cardio_fields').animate({
        height: "toggle",
        opacity: 1
      }, 150, function(){
        selector.parent().parent().children('.cardio_fields').children('.distance').css({display: 'none'});
        selector.parent().parent().children('.cardio_fields').children('.distance').find('.four_digit_entry').val('');
        selector.parent().parent().children('.cardio_fields').children('.interval').css({display: 'none'});
        selector.parent().parent().children('.cardio_fields').children('.interval').find('.four_digit_entry').val('');
      })
    }


   };


  })
}


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




$(function() {



    $( ".datepicker" ).datepicker({
      changeMonth: true,
      changeYear: true,
      dateFormat: "yy-mm-dd",

    });


var initialFields = $('.set_type_select');

for(var i =0; i < initialFields.length; i++){
  setTypeChange(initialFields.eq(i))
}

for(var i = 0; i < $('.weight_selector').length; i++){
  weightsNeeded($('.weight_selector').eq(i));
}


$(document).on('nested:fieldAdded', function(event){
  var typeSelector = event.field.find('.set_type_select');
  var weightSelector = event.field.find('.weight_selector');

  weightsNeeded(weightSelector);
  setTypeChange(typeSelector);

})

 dueDateNeeded();
 dueDateOnPageLoad();
 dueDateOnEdit();
});