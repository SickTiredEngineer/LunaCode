$(function () {
  console.log("faq 스크립트 실행됨");

  const $items = $(".faq-item");
  $items.removeClass("active");

  $items.each(function () {
    const $item = $(this);
    const $toggle = $item.find(".faq-toggle");

    $toggle.on("click", function () {
      $items.not($item).removeClass("active");
      $item.toggleClass("active");
    });
  });
  
});