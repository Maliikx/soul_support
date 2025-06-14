// Import the Admin model
const Admin = require('./models/admin'); // Import the Admin model from the correct path

// Query to check if admin_id = 1 exists
Admin.findOne({ where: { admin_id: 1 } })
  .then(admin => {
    // If an admin with admin_id = 1 is found
    if (admin) {
      console.log('Admin exists:', admin);
    } else {
      console.log('Admin with admin_id 1 does not exist');
    }
  })
  .catch(error => {
    // Handle any errors that happen during the query
    console.error('Error checking admin:', error);
  });
