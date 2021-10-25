import express from 'express';
import cors from 'cors';
import { loginUser, registerUser } from './src/controllers/login.js';
import { getHistory, sendEntry, sendOutput } from './src/controllers/historico.js';


const app = express();

app.use(cors());
app.use(express.json());

app.post('/sign-in',loginUser);
app.post('/sign-up',registerUser);
app.get('/userhistory',getHistory);
app.post('/sendEntry',sendEntry);
app.post('/sendOutput',sendOutput);


export default app;

