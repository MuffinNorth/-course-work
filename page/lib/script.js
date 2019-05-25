
var menu = document.getElementsByClassName('menu')[0];
console.log('Update');
var MainMenu = document.getElementsByClassName('mainMenu')[0];
window.onscroll = function() {
  var Scrolled = window.pageYOffset;
  if (!MainMenu.classList.contains('mainMenuClose')){
    MainMenu.classList.add('mainMenuClose');
  }
  if (Scrolled > 50) {
    menu.classList.add('menuBefore');
    MainMenu.classList.add('mainMenuBefore');
  } else if (Scrolled < 50) {
    menu.classList.remove('menuBefore');
    MainMenu.classList.remove('mainMenuBefore');
  }
}
function SwitchMenu() {
  console.log('In');
  if (MainMenu.classList.contains('mainMenuClose')) {
    MainMenu.classList.remove('mainMenuClose');
    MainMenu.classList.add('Duration');
  } else {
    MainMenu.classList.add('mainMenuClose');
  }
}
menu.getElementsByTagName('li')[0].onclick = function(){
  SwitchMenu()
}