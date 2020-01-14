$(function(){
  $('.chat__text_box').on('submit', function(e){
    e.preventDefault();
    console.log('aaa');
    let formData = new FormData(this);
  })
})