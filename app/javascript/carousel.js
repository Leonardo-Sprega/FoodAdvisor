
var slider = tns({
  container: '.my-slider',
  items: 3,
  slideBy: 'page',
  nav: false,
  controlsContainer: '.carouselBtns',
  autoplay: false,
  responsive: {
    0: {
        items: 1
    },
    640: {
      gutter: 20,
      items: 2
    },
    750: {
      gutter: 30
    },
    900: {
      items: 3
    }
  }
});

var slider2 = tns({
  container: '.suggestion',
  items: 3,
  slideBy: 'page',
  nav: false,
  controlsContainer: '.carouselBtns2',
  autoplay: false,
  responsive: {
    0: {
        items: 1
    },
    640: {
      gutter: 20,
      items: 2
    },
    750: {
      gutter: 30
    },
    900: {
      items: 3
    }
  }
});