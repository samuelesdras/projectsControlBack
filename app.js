const express = require('express');
var cors = require('cors')
const app = express();
app.use(cors());
const morgan = require('morgan');
const {Pool} = require('pg');
require('dotenv').config();

const port = process.env.PORT;

let pool = new Pool();

app.use(morgan('dev'));
app.use(express.urlencoded({extended:true}));
app.use(express.json());

app.get('/', (req, res) => {
    res.send(`
    <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
        </head>
        <body>
            <form action="/project/get" method="GET">
                <input type="submit" value="GET">
            </form>
            <form action="/project/add" method="POST">
                <label for="add">Add project name: </label>
                <input type="text" name="name" id="name">
                <br/>
                <label for="startdate">Add start date: </label>
                <input type="text" name="startdate" id="startdate">
                <br/>
                <label for="enddate">Add end date: </label>
                <input type="text" name="enddate" id="enddate">
                <input type="submit" value="ADD">
            </form>
            <form action="/project/delete" method="POST">
                <label for="delete">Delete: </label>
                <input type="text" name="id" id="id">
                <input type="submit" value="DELETE">
            </form>
            <form action="/project/update" method="POST">
                <label for="oldvalue">Old Value: </label>
                <input type="text" name="oldvalue" id="oldvalue">
                <label for="newvalue">NewValue: </label>
                <input type="text" name="newvalue" id="newvalue">
                <input type="submit" value="UPDATE">
            </form>
        </body>
        </html>
        `);
});

app.get('/project/get', (req, res) => {
    try{
    pool.connect(async (error, client, release) => {
        let resp = await client.query(`SELECT * FROM projects`);
        release();
        res.send(resp.rows);
    })
    }catch(error){
        console.group(error);
    }
});

app.get('/project/view/:id',(req, res) => {
    try{
    pool.connect(async(error, client, release) => {
        const { id } = req.params;
        let resp = await client.query(`SELECT * FROM projects WHERE id = ${ id }`);
        release();
        res.send(resp.rows[0]);
    })
    }catch(error){
        console.log(error);
    }
})

app.post('/project/add', (req, res) => {
    try{
    pool.connect(async (error, client, release) => {
        const data = req.body;
        let resp = await client.query(
            `INSERT INTO projects (name, startdate, enddate) 
            VALUES ('${data.name}', '${data.startdate}', '${data.enddate}')`
        );
        res.redirect('/project/get');
    })
    }catch(error){
        console.group(error);
    }
});

app.post('/project/delete/:id', (req, res) => {
    try{
    pool.connect(async (error, client, release) => {
        const { id } = req.params;
        let resp = await client.query(`DELETE FROM projects WHERE id = '${ id }'`);
        res.redirect('/project/get');
    })
    }catch(error){
        console.group(error);
    }
});

app.post('/project/update/:id', (req, res) => {
    try{
    pool.connect(async (error, client, release) => {
        const { id } = req.params;
        const data = req.body;
        let resp = await client.query(
            `UPDATE projects 
            SET name = '${data.name}', startdate = '${data.startdate}', enddate = '${data.enddate}'
            WHERE id = '${id}'`);
        res.redirect('/project/get');
    })
    }catch(error){
        console.group(error);
    }
});

app.get('/activity/get/:fatherProject', (req, res) => {
    try{
    pool.connect(async (error, client, release) => {
        const {fatherProject} = req.params;
        let resp = await client.query(
            `SELECT * 
            FROM activities
            WHERE project_id = '${fatherProject}'
            `);
        release();
        res.send(resp.rows);
    })
    }catch(error){
        console.group(error);
    }
});

app.get('/activity/get-all/', (req, res) => {
    try{
    pool.connect(async (error, client, release) => {
        let resp = await client.query(
            `SELECT * 
            FROM activities
            `);
        release();
        res.send(resp.rows);
    })
    }catch(error){
        console.group(error);
    }
});

app.get('/project-activity/get/:activityToEdit', (req, res) => {
    try{
    pool.connect(async (error, client, release) => {
        const {activityToEdit} = req.params;
        let resp = await client.query(
            `SELECT * 
            FROM activities
            WHERE id = '${activityToEdit}'
            `);
        release();
        res.send(resp.rows[0]);
    })
    }catch(error){
        console.group(error);
    }
});

app.post('/activity/add/:fatherProject', (req, res) => {
    try{
    pool.connect(async (error, client, release) => {
        const {fatherProject} = req.params;
        const data = req.body;
        let resp = await client.query(
            `INSERT INTO activities (name, startdate, enddate, finished, project_id) 
            VALUES ('${data.name}', '${data.startdate}', '${data.enddate}', '${data.finished}', '${fatherProject}')
            `);
        res.redirect('/project/get');
    })
    }catch(error){
        console.group(error);
    }
});

app.post('/activity/delete/:activityToDelete', (req, res) => {
    try{
    pool.connect(async (error, client, release) => {
        const { activityToDelete } = req.params;
        let resp = await client.query(`DELETE FROM activities WHERE id = '${ activityToDelete }'`);
        res.redirect('/project/get');
    })
    }catch(error){
        console.group(error);
    }
});

app.post('/activity/update/:activityToEdit', (req, res) => {
    try{
    pool.connect(async (error, client, release) => {
        const { activityToEdit } = req.params;
        const data = req.body;
        let resp = await client.query(
            `UPDATE activities 
            SET name = '${data.name}', startdate = '${data.startdate}', enddate = '${data.enddate}', finished = '${data.finished}'
            WHERE id = '${activityToEdit}'`);
        res.redirect('/project/get');
    })
    }catch(error){
        console.group(error);
    }
});

app.listen(port,() => {
    console.log(`server started on port ${port}`);
})