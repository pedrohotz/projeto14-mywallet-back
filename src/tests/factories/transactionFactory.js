/* eslint-disable camelcase */
import '../../setup.js';
import faker from 'faker';
import connection from '../../database/database.js';

export default async function createTransaction(user_Id) {
  const transaction = {
    date: faker.datatype.datetime(),
    decription: faker.lorem.words(10),
    value: faker.datatype.number(10, 50),
    type: 'entrada',
    userId: user_Id,
  };
  try {
    await connection.query('INSERT INTO historico (date,description,value,type,"userId") VALUES ($1,$2,$3,$4,$5)', [transaction.date, transaction.decription, transaction.value, transaction.type, transaction.userId]);
  } catch (error) {
    console.log(error);
  }
}
