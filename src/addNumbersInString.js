const getNumbersFromString = (string = "") => {
  const givenDelimiter = getDelimiter(string);
  if (!!givenDelimiter) string = string.slice(3);

  const delimiter = givenDelimiter ?? ",";
  const stringWithoutNewLines = string.replaceAll("\n", delimiter);

  return stringWithoutNewLines.trim().split(delimiter).map(Number);
};

const getDelimiter = (string = "") => {
  if (string.startsWith("//")) return string[2];
  else return null;
};

const addNumbersInString = (string = "") => {
  const numbers = getNumbersFromString(string);
  const negativeNumbers = numbers.filter((number) => number < 0);

  if (negativeNumbers.length)
    throw new Error(`Negatives not allowed: ${negativeNumbers.join(", ")}`);

  return numbers.reduce((acc, number) => acc + number, 0);
};

module.exports = addNumbersInString;
