const getNumbersFromString = (string = "") => {
  const stringWithoutNewLines = string.replaceAll("\n", ",");

  return stringWithoutNewLines.trim().split(",").map(Number);
};

const addNumbersInString = (string = "") => {
  const numbers = getNumbersFromString(string);

  return numbers.reduce((acc, number) => acc + number, 0);
};

module.exports = addNumbersInString;
