const addNumbersInString = (string = "") => {
  const numbers = string.trim().split(",").map(Number);

  return numbers.reduce((acc, number) => acc + number, 0);
};

module.exports = addNumbersInString;
