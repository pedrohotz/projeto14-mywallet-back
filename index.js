import express from 'express';
import cors from 'cors';
import { loginUser, registerUser } from './src/controllers/login.js';


const app = express();

app.use(cors());
app.use(express.json());

app.post('/sign-in',loginUser);
app.post('/sign-up',registerUser);

app.listen(4000);