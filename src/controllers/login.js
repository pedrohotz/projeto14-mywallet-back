import connection from "../database/database.js";
import {userValidation,userValidationLogin} from "../validation/validation.js";
import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';

async function loginUser(req,res){
    const {
        email,
        senha,
    } = req.body;

    const errors = userValidationLogin.validate({
        email,
        senha,
    }).error;
    
    if(errors){
        console.log(errors);
        res.sendStatus(400);
        return;
    }
    try {
        const user = await connection.query("SELECT * FROM usuarios WHERE email = $1",[email]);
        const hash = bcrypt.compareSync(senha,user.rows[0].password);

        if(!hash){
            res.sendStatus(401);
            return;
        }

        const token = uuid();
        await connection.query('INSERT INTO sessoes (token,"userId") VALUES ($1,$2)',[token,user.rows[0].id])
        const userResult = {
            name: user.rows[0].name,
            token: token,
        }
        res.send(userResult).status(200);

    } catch (error) {
        console.log(error)
        res.sendStatus(500);
    }
}


async function registerUser(req,res) {
    const {
        nome,
        email,
        senha,
    } = req.body;

    const errors = userValidation.validate({
        nome,
        email,
        senha,
    }).error;
    
    if(errors){
        console.log(errors);
        res.sendStatus(400);
        return;
    }
    const existentUser = await connection.query('SELECT * FROM usuarios WHERE email = $1',[email])
    if(existentUser.rowCount > 0){
        res.sendStatus(400);
        return;
    }
    
    try {
        const hash = bcrypt.hashSync(senha,12);

        await connection.query('INSERT INTO usuarios (name,email,password) VALUES ($1, $2, $3)',[nome,email,hash]);
        res.sendStatus(201);

    } catch (error) {
        res.sendStatus(500);
        console.log(error);
    }
}

export {
    loginUser,
    registerUser,
}