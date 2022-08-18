const express = require('express')
const routes = require('./routes')

const app = express();

app.use(express.json());
app.use(routes);

const porta = 5555;
app.listen(porta, () => {
    console.log('Servidor rodando na porta ' + porta)
});