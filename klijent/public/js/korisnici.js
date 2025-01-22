fetch("http://localhost:9000/users")
.then(res => res.json())
.then(users => {
    let html = '<table id="users" class="table table-striped"><tr><th colspan="4" class="text-center">Korisnici</th></tr><tr><th>Ime</th><th>Prezime</th><th>Email</th><th>Godine</th></tr>';
    users.forEach((user) => {
        html += '<tr><td>'+user.firstName+'</td><td>'+user.lastName+'</td><td>'+user.email+'</td><td>'+user.age+'</td></tr>';
    });
    html += '</table>'
    document.getElementById('korisnici').innerHTML = html;
});