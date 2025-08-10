import express from 'express';
import { createServer } from 'http';

const port = process.env.PORT || 3000;
const app = express();
app.use(express.json());
app.get('/', (req, res) => {
  res.send('Hello, World!');
});

const server = createServer(app);
server.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
