function date(message) {
  // Create a new Date object to get the current date and time
  const currentDate = new Date();

  // Concatenate the date and message with styling
  const logMessage = `%c${currentDate.toISOString()}%c - ${message}`;

  // Define the CSS styles for the date and the message
  const dateStyle = "color: red;";
  const messageStyle = "";

  // Return the formatted log message
  return [logMessage, dateStyle, messageStyle];
}

module.exports = date