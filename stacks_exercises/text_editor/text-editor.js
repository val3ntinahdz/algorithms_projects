class Node {
    constructor(data) {
        this.data = data;
        this.next = null;
    }
}

class TextEditor {
    // You will create a simple text editor that allows users to:

    // Type text.

    // Undo their last action (e.g., delete the last character or word).

    // Redo the last undone action.

    // How Stacks Come into Play:
    // Use one stack to keep track of changes (e.g., characters or words added/deleted).

    // Use another stack to keep track of undone actions for redo functionality.
    constructor() {
        this.historyStack = null;
        this.undoStack = null;
        this.text = "";
    }


    addText(data) { // push
        //  if the user types something, push the text to history stack
        this.text += data;

        const newNode = new Node(this.text);
        newNode.next = this.historyStack;
        this.historyStack = newNode;
    }

    undo() { // pop

        // Pop the last state from the history_stack and push it onto the undo_stack.

        // Display the previous state of the text.

        if (!this.historyStack) return; // if history stack is empty, do nothing!

        const lastState = this.historyStack.data;
        this.historyStack = this.historyStack.next; // pop the last state

        // push the last state onto de undoStack
        const newNode = new Node(lastState)
        newNode.next = this.undoStack;
        this.undoStack = newNode;

        this.text = this.historyStack ? this.historyStack.data : "";
    }

    redo() {  
        // Pop the last state from the undo_stack and push it back onto the history_stack.
        if (!this.undoStack) return;

        const lastUndoState = this.undoStack.data;
        this.undoStack = this.undoStack.next;

        const newNode = new Node(lastUndoState);
        newNode.next = this.historyStack;
        this.historyStack = newNode;

        this.text = lastUndoState;
    }

    display() {
        // show the current state of the text
        return "current text:" + this.text;
    }

}

module.exports = TextEditor;