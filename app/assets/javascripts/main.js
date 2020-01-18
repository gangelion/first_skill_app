$(function(){
  let langimage = $('.language__content_listimage');
  langimage.click(function(){
    $(this).toggleClass('active');
    if ( $(langimage).is('.active') ){ 
      // ボタンを有効化
      $('input').prop('disabled', false);
  } else { 
      // ボタンを無効化
      $('input').prop('disabled', true); 
  }
  });
});