$(function(){

  $('.btnDel').off().on('click', function(e){
    e.preventDefault();
    $(this).parent('.clonedInput').remove();
    return false;
  })

  $('#btnAdd').off().on('click', function(e) {
    e.preventDefault();

    var newInput = $('#input-default').clone();
    var number = (new Date)*1

    var name = newInput.find('.name')
    name.attr('name',  name.attr('name').replace('{{page-name-id}}', number))
    name.removeAttr('disabled','disabled')

    var value = newInput.find('.value')
    value.attr('name',  value.attr('name').replace('{{page-value-id}}', number))
    value.removeAttr('disabled','disabled')

    $('#list').append(newInput);
    newInput.show();

    return false;

  });

});
