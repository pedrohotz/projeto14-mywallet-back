import './setup.js';
import app from '../index.js';

const port = 4000;

app.listen(port, () => {
  console.log(`Server listening on port ${port}`);
});
