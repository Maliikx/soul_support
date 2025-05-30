
const express = require('express');
const homeRoutes = require('./routes/home');
const bodyParser = require('body-parser');
const app = express();
const http = require('http');
const server = http.createServer(app);
const io = require('socket.io')(server);
const db = require('./database');

app.use(bodyParser.json());

// Fix typo in header name: "Orogin" → "Origin"
app.use((req, res, next) => {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, PATCH, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type, Authorization');
  next();
});

app.use('/home', homeRoutes);

// Socket.io channel
io.on('connection', (client) => {
  console.log('New client connected!', client.id);

  client.on('load_history', async ({ patient_id, doctor_id }) => {
    if (!patient_id || !doctor_id) {
      return client.emit('error', { message: 'Missing patient_id or doctor_id' });
    }

    try {
      const [chats] = await db.query(
        'SELECT * FROM chats WHERE (patient_id = ? AND doctor_id = ?) ORDER BY created_at',
        [patient_id, doctor_id]
      );
      client.emit('chat_history', chats);
    } catch (err) {
      console.error('Error loading chat history:', err);
      client.emit('error', { message: 'Failed to load chat history' });
    }
  });

  client.on('msg', async (data) => {
    const { patient_id, doctor_id, message, sender } = data;

    // Validate required fields
    if (!patient_id || !doctor_id || !message || !sender) {
      return client.emit('error', { message: 'All fields are required to send a message' });
    }

    try {
      await db.query(
        'INSERT INTO chats (patient_id, doctor_id, message, sender) VALUES (?, ?, ?, ?)',
        [patient_id, doctor_id, message, sender,]
      );
      io.to(`room_${patient_id}_${doctor_id}`).emit('new_msg', data);
    } catch (err) {
      console.error('Error saving message:', err);
      client.emit('error', { message: 'Failed to send message' });
    }
  });

  client.on('join_room', ({ patient_id, doctor_id }) => {
    if (patient_id && doctor_id) {
      client.join(`room_${patient_id}_${doctor_id}`);
    } else {
      client.emit('error', { message: 'Missing patient_id or doctor_id for room join' });
    }
  });
});

server.listen(8080, () => {
  console.log('Server is running on port 8080');
});

