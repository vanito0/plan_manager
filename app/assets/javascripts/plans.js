$(document).ready(function() {

  let txt = document.getElementById("toggleWrap"),
      txt2 = document.getElementById("toggleWrap2");

  if ($(".fulltime_flag").prop("checked") == false) {
    txt.style.display = "block";
    txt2.style.display = "none";
  } else {
    txt.style.display = "none";
    txt2.style.display = "block";
  }
});

$(function () {

  $('.fulltime_flag').on('click', function () {
    $('.toggleWrap').toggle();
    $('.toggleWrap2').toggle();
  })
});