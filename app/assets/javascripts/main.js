$(function(){
  let languageButton = $('.language__content');
  languageButton.click(function(){
    languageButton.removeClass('active');
    $(this).addClass('active');
    $(languageButton).is('.active') 
    $('.submit_button').prop('disabled', false);
  });
});