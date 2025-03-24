const express = require('express');
const routes = express.Router();

const Cliente = require('./controllers/cliente');
const Pizza = require('./controllers/pizza');
const Pedido = require('./controllers/pedido');

routes.get('/', (req, res) => {
  return res.json({ titulo: 'Pizzaria Ginno e Silva' });
});

routes.post('/clientes', Cliente.create);
routes.get('/clientes', Cliente.read);
routes.get('/clientes/:id', Cliente.readOne);
routes.patch('/clientes/:id', Cliente.update);
routes.delete('/clientes/:id', Cliente.remove);

routes.post('/pizzas', Pizza.create);
routes.get('/pizzas', Pizza.read);
routes.get('/pizzas/:id', Pizza.readOne);
routes.patch('/pizzas/:id', Pizza.update);
routes.delete('/pizzas/:id', Pizza.remove);

routes.post('/pedidos', Pedido.create);
routes.get('/pedidos', Pedido.read);
routes.get('/pedidos/:id', Pedido.readOne);
routes.patch('/pedidos/:id', Pedido.update);
routes.delete('/pedidos/:id', Pedido.remove);

module.exports = routes;