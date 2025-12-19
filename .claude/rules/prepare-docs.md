# Zig Project Documentation Task

## Objective
Add comprehensive Zig doc comments (///) to all public declarations in the project while maintaining zero functional changes.

## Scope

### Include:
- All `.zig` files in the project
- Every `pub` function, variable, constant, struct, enum, union, and type

### Exclude:
- Files matching `*_test.zig` or `*_tests.zig`
- `build.zig` and `build.zig.zon`
- Private (non-`pub`) declarations

## Documentation Standards

### Format
- Use `///` for doc comments (Zig's standard documentation syntax)
- Place doc comments immediately before the declaration
- Keep comments concise but informative
- Describe what the item does, not how it works internally

### Content Guidelines
- **Functions**: Describe purpose, parameters, return values, and any errors
- **Types**: Explain what the type represents and its use case
- **Constants**: Explain the meaning and purpose of the value
- **Variables**: Describe what the variable represents

### Example Style
```zig
/// Initializes a new reactor instance with the specified configuration.
/// Returns an error if initialization fails.
pub fn init(allocator: Allocator, config: Config) !Reactor {
    // implementation
}

/// Maximum number of concurrent connections allowed.
pub const MAX_CONNECTIONS: usize = 1000;

/// Represents the current state of a network connection.
pub const ConnectionState = enum {
    idle,
    connecting,
    connected,
    disconnected,
};
```

## Workflow Requirements

### File Processing
1. Edit files in-place (no temporary copies)
2. Process one file at a time
3. After editing each file, verify syntax with: `zig ast-check <filename>`
4. If syntax check fails, immediately fix the issue before proceeding
5. Show a summary after each file: filename, number of items documented

### Git Safety Rules
**CRITICAL**:
- NEVER execute git commands automatically
- NEVER run `git add`, `git commit`, `git push`, or any git operation without explicit user approval
- After completing documentation work, suggest git commands but WAIT for user permission
- Example suggestion format:
```
  Documentation complete. Suggested git commands:
  git add <files>
  git commit -m "Add doc comments to public declarations"
  
  Should I proceed with these commands? (yes/no)
```

### Quality Checks
- Ensure all `pub` declarations have doc comments
- Verify no functionality changes (only comments added)
- Confirm syntax validity with `zig ast-check`
- No changes to logic, types, or behavior

## Execution Plan
1. Scan project for all `.zig` files (excluding test files and build.zig)
2. For each file:
    - Read and analyze public declarations
    - Add appropriate doc comments
    - Save changes in-place
    - Run `zig ast-check` to verify syntax
    - Report results
3. Provide final summary of all documented files
4. Suggest (but don't execute) git commands for review

## Notes
- Preserve existing formatting and style
- Don't modify any existing comments
- If a declaration already has doc comments, review and improve if needed
- Focus on clarity and usefulness for API consumers
