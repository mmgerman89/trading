console.log("ruletah");

var sounds = {
    spin: new Audio('https://cdn.rawgit.com/ManzDev/cursos-assets/gh-pages/js/spin.mp3'),
    win: new Audio('https://cdn.rawgit.com/ManzDev/cursos-assets/gh-pages/js/win.mp3')
  }
  
  var roulette = document.querySelector('#roulette');
  var arrow = document.querySelector('#arrow');
  var txt = document.querySelector('#txt');
  var item = document.querySelector('#item');
  
  var offset = 0;
  var items = [['fa-comment', 'twitter', ''],
               ['fa-comment', 'refresh', ''],
               ['fa-comment', 'battery', ''],
               ['fa-bomb', 'bomb', ''],
               ['fa-comment', 'comment', ''],
               ['fa-heart', 'heart', ''],
  ];
  var maxOffset = items.length * 200;
  
  var wheel = {
    speed: 100,
    
    getSpeed: function() {
      this.speed = this.speed - Math.round(Math.random() * 1);
      if (this.speed < 0)
        return 0;
      return this.speed;
    },
    resetSpeed: function() { this.speed = 100 }
  }
  
  items.forEach(function(e) {
    var newItem = item.content.cloneNode(true);
    newItem.querySelector('i').classList.add(e[0]);
    newItem.querySelector('span').textContent = e[1];
    roulette.appendChild(newItem);
  });
                          
  function spin() {
    sounds.spin.play();
    arrow.classList.remove('shine');
    
    console.log('max: ', maxOffset);
    
    timer = setInterval(function() {
      offset = offset + wheel.getSpeed();
      if ((offset > maxOffset) || (offset < 0)) 
        offset = 0;
      roulette.style.transform = 'translateX(-'+offset+'px)';
    }, 10);
    
    setTimeout(function() {
      clearInterval(timer);
      wheel.resetSpeed();
      sounds.spin.pause();
      sounds.spin.currentTime = 0;
      sounds.win.play();
      arrow.classList.add('shine');
      /*
      var selected = Math.floor( (150 + offset) / (maxOffset / items.length) );
      txt.textContent = items[selected][1];
      */
    }, 2500);
  }