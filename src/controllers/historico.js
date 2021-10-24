import dayjs from "dayjs";
import connection from "../database/database.js";


async function getHistory(req,res){
    const  token  = req.headers.authorization?.replace('Bearer ', '');
    console.log(token);
    try {
        const existentSession = await connection.query('SELECT * FROM sessoes WHERE token = $1',[token]);
        if(existentSession.rowCount === 0){
            res.sendStatus(401);
            return;
        }

        const userHistory = await connection.query('SELECT date,description,value,type FROM historico WHERE "userId" = $1 LIMIT 10',[existentSession.rows[0].userId]);
        if(userHistory.rowCount === 0){
            res.sendStatus(404);
            return;
        }
        res.send(userHistory.rows).status(200);

    } catch (error) {
        console.log(error)
        res.sendStatus(500);
    }
}



export {
    getHistory,
}