const express = require('express');
const os = require('os');
const { Pool } = require('pg');
require('dotenv').config();

const app = express();
const port = process.env.PORT || 3001;


const pool = new Pool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    database: process.env.DB_NAME,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
}); // vai dar as informações para saber que banco de dados ele vai se conectar

// Middleware para parsear JSON
app.use(express.json());

// Middleware CORS para permitir qualquer origem
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Methods', 'GET, POST');
    res.header('Access-Control-Allow-Headers', 'Content-Type');
    next();
});

// Rota para listar todas as pessoas
app.get('/geleias', async (req, res) => {
    try {
        const query = 'SELECT id, nome, sabor, ingredientes, descricao, harmonizacao, peso, preco, validade, imagem, categoria_id FROM GELEIA ORDER BY id';
        const result = await pool.query(query);
        
        res.json({ 
            sucesso: true, 
            geleias: result.rows,
            quantidade: result.rows.length
            
        });

        
    } catch (error) {
    console.log(error); // <- essencial
    res.status(500).json({
        sucesso: false,
        mensagem: error.message
    });
}
});


const obterIP = () => {
    const interfaces = os.networkInterfaces();
    for (let nomeInterface in interfaces) {
        for (let info of interfaces[nomeInterface]) {
            if (info.family === 'IPv4' && !info.internal) return info.address;
        }
    }
    return 'localhost';
};

const ip = obterIP();

app.get('/api/geleias/:id', async (req, res) => {
    try {
        const query = `
            SELECT id, nome, sabor, ingredientes, descricao, harmonizacao, peso, preco, validade, imagem, categoria_id
            FROM GELEIA
            WHERE id = $1
        `;

        const result = await pool.query(query, [req.params.id]);

        if (result.rows.length === 0) {
            return res.status(404).json({
                erro: "Produto não encontrado"
            });
        }

        res.json(result.rows[0]);

    } catch (error) {
        console.log(error);

        res.status(500).json({
            erro: "Erro ao buscar produto"
        });
    }
});

app.listen(port, '0.0.0.0', () => {
    console.log(`Servidor rodando em http://${ip}:${port}`);
    console.log(`Rotas disponíveis:`);
    console.log(`GET http://${ip}:${port}/geleias - Listar todas as geleias`);
});

app.get("/geleias/categoria/:id", async (req, res) => {

    try {

        const id = req.params.id;

        const query = `
            SELECT
                g.id,
                g.nome,
                g.sabor,
                g.preco,
                g.imagem,
                c.nome AS categoria
            FROM GELEIA g
            JOIN CATEGORIA c
                ON g.categoria_id = c.id
            WHERE c.id = $1
            ORDER BY g.nome;
        `;

        const result = await pool.query(query, [id]);

        res.json({
            sucesso: true,
            geleias: result.rows
        });

    } catch (error) {
        console.log(error);
        res.status(500).json({
            sucesso: false,
            mensagem: error.message
        });
    }

});