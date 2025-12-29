# Commit Message Conventions

## Standard Formats

### Conventional Commits

A specification for adding human and machine readable meaning to commit messages.

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

**Types:**
- `feat`: A new feature
- `fix`: A bug fix
- `docs`: Documentation only changes
- `style`: Changes that do not affect the meaning of the code (white-space, formatting, etc)
- `refactor`: A code change that neither fixes a bug nor adds a feature
- `perf`: A code change that improves performance
- `test`: Adding missing tests or correcting existing tests
- `chore`: Changes to the build process or auxiliary tools
- `ci`: Changes to CI configuration files and scripts
- `build`: Changes that affect the build system or external dependencies

**Examples:**
```
feat: add user authentication

Implement login using JWT tokens with refresh token rotation.
Includes password validation and session management.

Closes #123
```

```
fix(api): prevent null pointer exception in user service

The user service was throwing NPE when retrieving users
with missing profile data. Added null check to handle gracefully.

Fixes #456
```

### Simple Descriptive Format

For projects not using Conventional Commits:

```
<imperative verb phrase> <what and why>

<detailed explanation if needed>
```

**Examples:**
```
Add user authentication with JWT tokens

Implements secure login using JWT with refresh token rotation.
Includes password validation and session management.
```

```
Fix memory leak in image processing pipeline

The image processor was holding references to processed images
in memory even after they were written to disk. Now properly
releases references after file write completes.
```

## Writing Good Commit Messages

### DO:
- Use present tense ("add" not "added")
- Use imperative mood ("add" not "adds" or "adding")
- Focus on WHY, not just WHAT
- Be concise but informative
- Reference related issues (Fixes #123, Closes #456)
- Keep first line under 50 characters
- Wrap body at 72 characters

### DON'T:
- Use past tense ("added feature")
- Use present continuous ("adding feature")
- Be vague ("update code", "fix stuff")
- Write novels (keep it focused)
- Mix unrelated changes (split them up)
- Include sensitive data (passwords, tokens, keys)

## Commit Message Examples

### Feature Addition
```
feat: add dark mode toggle

Add theme switcher in settings that allows users to toggle
between light and dark modes. Persists preference in localStorage.
```

### Bug Fix
```
fix: prevent duplicate submissions on form double-click

The submit button was not disabled after clicking, allowing users
to submit the form multiple times. Now disables button immediately
on first click.
```

### Refactoring
```
refactor: extract user validation to separate service

Move user validation logic from controllers to dedicated
UserValidator service for better testability and reusability.
```

### Documentation
```
docs: add API authentication guide

Add comprehensive documentation for API authentication including
examples for JWT handling and refresh token flow.
```

### Breaking Changes
```
feat: change user API response format

BREAKING CHANGE: The user API now returns nested user profile
data instead of flat structure. Update clients to access
profile fields via user.profile.* instead of user.*.
```
