const addNumbersInString = require("./addNumbersInString");

test("should return sum of multiple numbers in the string", () => {
  expect(addNumbersInString("1,5")).toBe(6);
});

test("should return the number if there is only one number present", () => {
  expect(addNumbersInString("1")).toBe(1);
});

test("should return 0 if the string is empty", () => {
  expect(addNumbersInString()).toBe(0);
  expect(addNumbersInString("")).toBe(0);
});
