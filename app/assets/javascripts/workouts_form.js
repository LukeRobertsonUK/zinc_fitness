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




$(function() {

var initialFields = $('.set_type_select');

for(var i =0; i < initialFields.length; i++){
  setTypeChange(initialFields.eq(i))
}

$(document).on('nested:fieldAdded', function(event){
  var selector = event.field.find('.set_type_select');

    setTypeChange(selector);
})


});