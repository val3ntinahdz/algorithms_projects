const TextEditor = require("./text-editor");

const textEditor = new TextEditor();
textEditor.addText("hello")
console.log(textEditor.display());
textEditor.addText(" valentina")
textEditor.addText(" diana")
console.log(textEditor.display());
textEditor.undo();
console.log(textEditor.display());
textEditor.addText(" camila");
textEditor.addText(" beyda");
console.log(textEditor.display());
textEditor.undo();
console.log(textEditor.display());
textEditor.redo();
console.log(textEditor.display());