var x = document.getElementsByClassName("parent");

for (var i = 0; i < x.length; i++) {
  var el = x[i];

  var swiper = el.getElementsByClassName("swiper-container")[0];
  var nx = el.getElementsByClassName("swiper-button-next")[0];
  var pr = el.getElementsByClassName("swiper-button-prev")[0];

  new Swiper(swiper, {
    slidesPerView: 3,
    spaceBetween: 35,
    navigation: {
      nextEl: nx,
      prevEl: pr,
    },
  });
}
