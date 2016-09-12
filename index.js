var express = require('express')
var bodyParser = require('body-parser')
var mysql = require('mysql')
var config = require('./config')

var con = mysql.createConnection({
  host:'localhost',
  user: 'root',
  password: 'ws7',
  database: 'rifas'
})

var app = express()
app.set("view engine", "jade")

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: true}))

app.get('/', function(req, res) {
  res.render('index')
})

app.post('/guardar', function(req, res) {
  var users = []
  var desde = req.body.desde
  var hasta = req.body.hasta
  var sql = 'INSERT INTO nros (vendedor, nro, estado, anio, valor) VALUES ?'
  for(var i = desde; i <= hasta; i++) {
    users.push([req.body.id, i, '1', config.anio, config.valor])
  }


  //console.log(sql)
  //var rifa = {flia: flia, }

  con.query(sql, [users], function(err, rows) {
    if(!err) {
      console.log(rows)
      //res.send({msg: 'Prueba limpia'})
      res.render('index', {msg: 'Ingreso correcto'})
    } else {
      console.log(err)
      //res.send()
      res.render('index', {msg: 'Hubo un error, revise la numeración'})
    }
  })
})

app.post('/buscarnombre', function(req, res) {
  var nombre = req.body.nombre
  var sql = 'SELECT * FROM vendedores WHERE nombre like \'%'+nombre+'%\''
  con.query(sql, function(err, rows) {
      res.send({filas: rows})
  })

})

app.get('/buscar/:id', function(req, res) {
  var b = req.params.id
  if(b === 'v') {

    res.render('busqueda')
  }
  else {
    res.render('busquedan')
  }
})

app.post('/buscar/:id' , function(req, res) {
    var texto = req.body.campo
    var tipo = req.params.id
    if(tipo === 'v') {
      var sql = 'SELECT n.*, v.nombre, e.estado as est FROM nros n JOIN estados e ON e.id_estado = n.estado JOIN vendedores v ON v.id_vendedor = n.vendedor WHERE vendedor = ' + texto + ' ORDER BY n.id_nro'
    } else {
      var sql = 'SELECT n.*, v.nombre, e.estado as est FROM nros n JOIN estados e ON e.id_estado = n.estado JOIN vendedores v ON v.id_vendedor = n.vendedor WHERE nro='+ texto + ' ORDER BY n.id_nro'
    }

    con.query(sql, function(err, rows) {
        if(!err) {
          if(tipo === 'v') {
              res.render('busqueda', {filas: rows})
          } else {
              res.render('busquedan', {filas: rows})
          }

        } else {
            if(tipo === 'v') {
              console.log(err)
            res.render('busqueda')
          } else {
              res.render('busquedan')
          }
        }
    })
})

app.get('/cuota/:pago/:id', function(req, res) {
  var pago = req.params.pago
  var id= req.params.id
  var valores = {estado:2, reasignado:1}
  var where = {id_nro: id}

  switch(pago) {
    case '1':
      valores.estado = 2
      break
    case '2':
      valores.estado = 3
      break
    case '3':
        valores.estado = 3
  }
  con.query('UPDATE nros SET ? WHERE ?' , [valores, where], function(err, rows) {
    if(!err) {
      res.redirect('back')
      console.log(rows)
    } else {
      console.log(err)
      res.redirect('back')
    }
  })
})

app.get('/reasignar/:id', function(req, res) {
    var id = req.params.id
    var nombre = ''
    var nro = ''
    con.query('SELECT v.nombre, n.* FROM vendedores v JOIN nros n ON n.vendedor = v.id_vendedor WHERE n.id_nro = '+ id, function(err, rows) {
        if(!err) {
            console.log(rows)
            res.render('reasignar', {nombre: rows[0].nombre, nro: rows[0].id_nro})
        } else {
            console.log(err)
        }
    } )

})

app.post('/reasigna', function(req, res) {
    var id = req.body.nro
    var vendedor = req.body.vendedor
    valores = {vendedor: vendedor}
    var where = {id_nro: id}
    con.query('UPDATE nros SET ? WHERE ?' , [valores, where], function(err, rows) {
      if(!err) {
        res.send(rows)
      } else {
        res.end(err)
      }
    
    })
})

app.listen(8000, function() {
  console.log("Escuchando puerto 8000")
})
