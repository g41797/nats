    # Zig 0.14.1 to 0.15.2 Migration Project

## Project Overview
You are migrating a Zig project from version 0.14.1 to 0.15.2. The project requires careful, methodical updates to ensure compatibility with the newer Zig version.

## Critical Requirements

### Git Operations - MANDATORY RULES
- **NEVER execute git commands automatically**
- **ALWAYS ask for explicit user permission before ANY git operation**
- This includes: `git add`, `git commit`, `git push`, `git checkout`, `git branch`, etc.
- When suggesting git operations, present the commands and wait for user approval
- Example: "I suggest running: `git add file.zig`. Should I proceed?" and wait for confirmation

### Verification Process
- After editing each file, **immediately verify the syntax** using `zig ast-check <filename>`
- Do not proceed to the next file until syntax verification passes
- If syntax errors are found, fix them before moving on

### File Editing Approach
- Edit files **in-place** (modify existing files, don't create new ones)
- Make focused, targeted changes for version compatibility
- Preserve the existing code structure and style

### Zig Version Verification
- Although Zig 0.15.2 will be pre-installed, **always verify the version** before starting
- Run `zig version` to confirm you're working with the correct version
- Report any version discrepancies immediately

## Migration Workflow

### Step 1: Initial Setup
1. Verify Zig installation: `zig version`
2. Confirm it shows 0.15.2 (or report if different)
3. Review project structure to understand the codebase

### Step 2: Identify Breaking Changes
Research and document breaking changes between 0.14.1 and 0.15.2:
- Build system updates (build.zig, build.zig.zon)
- Standard library API changes
- Language syntax changes
- Compiler behavior changes
- Deprecated features removed

### Step 3: Build System Updates
- Check and Update `build.zig` and 'build.zig.zon' for 0.15.2 compatibility
- Verify build system changes with syntax check
- Test the build configuration


### Step 4: File-by-File Migration
For each Zig source file:
1. **Analyze** the file for compatibility issues
2. **Edit** the file in-place with necessary changes
3. **Verify** syntax immediately: `zig ast-check <filename>`
4. **Document** what was changed and why
5. Only proceed to next file after successful verification

### Step 5: Testing and Validation
- After all files are migrated and verified, suggest running tests
- Check for runtime issues beyond syntax
- Validate that the project builds successfully

## Common Migration Patterns

### Likely Changes Needed (research current patterns for 0.15.2):
- Build system API updates
- Standard library import paths
- Allocator API changes
- Error handling patterns
- Async/await syntax updates
- Type inference changes
- String/slice handling updates

## Communication Style
- Report progress file-by-file
- Explain what changes you're making and why
- Ask for clarification when patterns are ambiguous
- **Always request permission before git operations**
- Be explicit about verification results

## Example Workflow
```
1. "Checking Zig version..." → `zig version`
2. "Analyzing src/main.zig for compatibility issues..."
3. "Making changes to src/main.zig: [explain changes]"
4. "Verifying syntax..." → `zig ast-check src/main.zig`
5. "✓ Syntax verification passed. Moving to next file."
6. [After all files] "I suggest committing these changes with: 
   `git add .`
   `git commit -m 'Migrate from Zig 0.14.1 to 0.15.2'`
   Should I proceed with these git commands?"
```

## Error Handling
- If syntax verification fails, stop and fix immediately
- Report all errors clearly with file and line information
- Don't skip files or make assumptions about "probably working"
- Ask for guidance if migration patterns are unclear

## Success Criteria
- All .zig files pass `zig ast-check`
- Build.zig is updated and verified
- Project structure remains intact
- All changes are documented
- User has explicitly approved any git operations before they execute

## Important Notes
- This is a systematic, careful migration - not a rush job
- Verification after each file is non-negotiable
- Git operation approval is mandatory
- In-place editing preserves project history
- Version check happens regardless of pre-installation status

Begin by verifying the Zig version and reviewing the project structure.
