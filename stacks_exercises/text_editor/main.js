const TextEditor = require("./text-editor");

const textEditor = new TextEditor();
textEditor.addText("hello")
console.log(textEditor.display());
textEditor.addText(" valentina")
console.log(textEditor.display());

// console.log("Stack elements ->", stack.printStack());
// console.log("Popped element:", stack.pop());
// console.log("Stack after pop: ", stack.printStack());
// console.log("Peek element:", stack.peek());