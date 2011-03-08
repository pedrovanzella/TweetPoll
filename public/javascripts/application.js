$(document).ready(function() {
        var i = 0;
  $("#button").bind("click", function() {
    /* Generating unique id
    */
    
    var input = "<li class='string required' id='poll_answers_attributes_"+i+"_text_input'><label for='poll_answers_attributes_"+i+"_text'>Answer "+ (i+1) +"<abbr title='required'>*</abbr></label><input id='poll_answers_attributes_"+i+"_text' maxlength='255' name='poll[answers_attributes]["+i+"][text]' size='50' type='text' /></li><hr />";
    $(this).before( input );
    i++;
  });

  /* Pushing the first input to the DOM
  */
  $("#button").trigger("click");

});