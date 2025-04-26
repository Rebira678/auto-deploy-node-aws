// 1. Load built-in HTTP module to create a web server
const http = require('http');

// 2. Create the server
const server = http.createServer((req, res) => {
  // Set the status code to 200 (OK)
  res.statusCode = 200;

  // Set the content type to plain text
  res.setHeader('Content-Type', 'text/plain');

  // Send the response to the browser
  res.end('🚀 Hello, World! This is my Node.js app on AWS!\n');
});

// 3. Choose port (from environment or default to 3000)
const PORT = process.env.PORT || 3000;

// 4. Start the server and listen on the chosen port
server.listen(PORT, () => {
  console.log(`✅ Server running at http://localhost:${PORT}`);
});


