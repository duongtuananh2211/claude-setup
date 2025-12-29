# Search Examples and Regex Patterns

This document contains useful search patterns and examples for the searcher skill.

## Common Search Patterns

### Text Literals
Simply search for exact text:
```
pattern: "function_name"
pattern: "TODO"
pattern: "import"
```

### Regex Patterns
Use regex for more complex searches:

| Pattern | Description | Example Matches |
|---------|-------------|-----------------|
| `todo.*fix` | "todo" followed by "fix" | `// TODO: fix this bug` |
| `function\s+\w+` | "function" followed by word | `function myFunc`, `function test` |
| `(class|struct)\s+\w+` | "class" or "struct" keywords | `class User`, `struct Data` |
| `import.*from` | Import statements | `import React from 'react'` |
| `//.*TODO` | TODO comments | `// TODO: add error handling` |
| `#\s*TODO` | Python TODO comments | `# TODO: refactor` |

### Escaping Special Characters
Special regex characters need escaping: `. * + ? ^ $ { } [ ] ( ) | \ /`

| To Find | Use Pattern |
|---------|-------------|
| `file.js` | `file\.js` |
| `c:\users` | `c:\\users` |
| `test(value)` | `test\(value\)` |

## Output Mode Examples

### files_with_matches
Returns only file paths:
```
Grep: pattern="TODO", output_mode="files_with_matches"

Output:
src/main.py
utils/helper.js
README.md
```

### content
Returns matching lines with context:
```
Grep: pattern="TODO", output_mode="content", -C=1

Output:
src/main.py:10:# TODO: Add error handling
src/main.py:11:def process():
utils/helper.js:25:  // TODO: Refactor this
utils/helper.js:26:  function help() {
```

### count
Returns match counts per file:
```
Grep: pattern="TODO", output_mode="count"

Output:
src/main.py: 5
utils/helper.js: 2
README.md: 1
```

## File Type Filtering

### Using type parameter
```
type: "py"     # Python files
type: "js"     # JavaScript files
type: "ts"     # TypeScript files
type: "java"   # Java files
type: "go"     # Go files
type: "rs"     # Rust files
```

### Using glob parameter
```
glob: "*.md"           # Markdown files
glob: "**/*.test.js"   # Test files anywhere
glob: "src/**/*.py"    # Python files in src/
glob: "*.{js,ts}"      # JS or TS files
```

## Practical Examples

### Find all TODO/FIXME comments
```bash
pattern: "(TODO|FIXME):", output_mode: "content", -i=true
```

### Find function definitions in Python
```bash
pattern: "^def\s+\w+", type: "py", output_mode: "content"
```

### Find import statements
```bash
pattern: "^import\s+", output_mode: "content"
```

### Find console.log statements (debugging)
```bash
pattern: "console\.log", type: "js", output_mode: "content"
```

### Find API endpoint definitions
```bash
pattern: "@(get|post|put|delete|patch)", output_mode: "content"
```

### Find environment variable usage
```bash
pattern: "process\.env\.", output_mode: "content"
```

### Find SQL queries in code
```bash
pattern: "(SELECT|INSERT|UPDATE|DELETE).*FROM", output_mode: "content", -i=true
```
