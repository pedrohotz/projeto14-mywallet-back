/* eslint-disable no-undef */
import '../setup.js';
import supertest from 'supertest';
import { v4 as uuid } from 'uuid';
import index from '../../index.js';
import connection from '../database/database.js';
import createUser from './factories/userFactory.js';
import createTransaction from './factories/transactionFactory.js';

afterAll(async () => {
  connection.end();
});

describe('POST /sign-in', () => {
  it('returns 200 for valid sign-in', async () => {
    const user = await createUser();
    const result = await supertest(index).post('/sign-in').send({
      email: user.email,
      senha: user.password,
    });
    expect(result.status).toEqual(200);
  });

  it('returns 401 for invalid sign-in', async () => {
    const result = await supertest(index).post('/sign-in').send({
      email: 'testing@email.com',
      senha: '123456',
    });
    expect(result.status).toEqual(401);
  });
});

describe('GET /userhistory', () => {
  it('returns 200 and data for valid get userhistory', async () => {
    const user = await createUser();
    const validToken = uuid();
    await connection.query('INSERT INTO sessoes ("token","userId") VALUES ($1,$2)', [validToken, user.id]);
    await createTransaction(user.id);
    const result = await supertest(index).get('/userhistory').set('Authorization', `Bearer ${validToken}`);
    expect(result.status).toEqual(200);
  });

  it('returns 401 for invalid token get userhistory', async () => {
    const result = await supertest(index).get('/userhistory');
    expect(result.status).toEqual(401);
  });
});
