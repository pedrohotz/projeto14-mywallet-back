import '../../setup.js';
import bcrypt from 'bcrypt';
import faker from 'faker';
import connection from '../../database/database.js';

export default async function createUser() {
  const user = {
    name: faker.name.findName(),
    email: faker.internet.email(),
    password: '123456',
    hashedPassword: bcrypt.hashSync('123456', 10),
  };

  const insertedUser = await connection.query(
    'INSERT INTO usuarios (name, email, password) VALUES ($1, $2, $3) RETURNING *',
    [user.name, user.email, user.hashedPassword],
  );

  user.id = insertedUser.rows[0].id;

  return user;
}
