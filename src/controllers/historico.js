import dayjs from 'dayjs';
import connection from '../database/database.js';
import { entranceValidation } from '../validation/validation.js';

async function getHistory(req, res) {
  const token = req.headers.authorization?.replace('Bearer ', '');

  if (!token) {
    res.sendStatus(401);
    return;
  }
  try {
    const existentSession = await connection.query('SELECT * FROM sessoes WHERE token = $1', [token]);
    if (existentSession.rowCount === 0) {
      res.sendStatus(401);
      return;
    }

    const userHistory = await connection.query('SELECT date,description,value,type FROM historico WHERE "userId" = $1 LIMIT 15', [existentSession.rows[0].userId]);
    if (userHistory.rowCount === 0) {
      res.sendStatus(404);
      return;
    }
    res.send(userHistory.rows).status(200);
  } catch (error) {
    res.sendStatus(500);
  }
}

async function sendEntry(req, res) {
  const token = req.headers.authorization?.replace('Bearer ', '');
  const {
    description,
    value,
  } = req.body;

  const errors = entranceValidation.validate({
    value,
    description,

  }).error;
  if (errors) {
    res.sendStatus(400);
    return;
  }
  const type = 'entrada';
  try {
    const existentSession = await connection.query('SELECT * FROM sessoes WHERE token = $1', [token]);
    if (existentSession.rowCount === 0) {
      res.sendStatus(401);
      return;
    }
    const date = dayjs();

    await connection.query('INSERT INTO historico (date,description,value,type,"userId") VALUES ($1,$2,$3,$4,$5)', [date, description, value, type, existentSession.rows[0].userId]);
    res.sendStatus(201);
  } catch (error) {
    res.sendStatus(500);
  }
}

async function sendOutput(req, res) {
  const token = req.headers.authorization?.replace('Bearer ', '');
  const {
    description,
    value,
  } = req.body;
  const type = 'saida';
  try {
    const existentSession = await connection.query('SELECT * FROM sessoes WHERE token = $1', [token]);
    if (existentSession.rowCount === 0) {
      res.sendStatus(401);
      return;
    }
    const date = dayjs();

    await connection.query('INSERT INTO historico (date,description,value,type,"userId") VALUES ($1,$2,$3,$4,$5)', [date, description, value, type, existentSession.rows[0].userId]);
    res.sendStatus(201);
  } catch (error) {
    res.sendStatus(500);
  }
}

export {
  getHistory,
  sendEntry,
  sendOutput,
};
