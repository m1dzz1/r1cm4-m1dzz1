fetch("http://localhost:9000/kucni_red_skole")
.then(res => res.json())
.then(kucni_red_skole => {
  let html = '<ol>';
  kucni_red_skole.forEach((jedan_red) => {
    html += '<li>' + jedan_red.opis + '</li>';
  });
  html += '</ol>';
  document.getElementById('kucni_red').innerHTML = html;
});