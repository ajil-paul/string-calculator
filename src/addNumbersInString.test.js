const addNumbersInString = require("./addNumbersInString");

test("should find the sum of multiple numbers in the string", () => {
  expect(addNumbersInString("1,5")).toBe(6);
});

test("should return the number if there is only one number present", () => {
  expect(addNumbersInString("1")).toBe(1);
});

test("should return 0 if the string is empty", () => {
  expect(addNumbersInString()).toBe(0);
  expect(addNumbersInString("")).toBe(0);
});

test("should find the sum even if the numbers are separated by new line", () => {
  expect(addNumbersInString("1\n2,3\n4")).toBe(10);
});

test("should find the sum even if the numbers are separated by custom delimiter", () => {
  expect(addNumbersInString("//;\n1;2;3")).toBe(6);
});

test("should throw an error if there are negative numbers", () => {
  expect(() => addNumbersInString("2,-2,3,-3")).toThrow(
    "Negatives not allowed: -2, -3"
  );
});
