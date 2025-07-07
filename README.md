# Generic Maven Project Release Script

This project provides a robust, interactive Bash script (`release.sh`) to automate the release process for any Maven-based Java project. It handles version management, builds, git operations, and GitHub releases in a single workflow.

## Features
- Updates version numbers in both `VERSION` file and `pom.xml`
- Builds the JAR file using Maven or Maven Wrapper
- Commits and pushes changes to git
- Creates and pushes git tags
- Creates GitHub releases with JAR attachments
- Interactive prompts for versioning, commit messages, and release notes
- Retry logic for GitHub uploads

## Prerequisites
- A Maven project with a `pom.xml` in the root directory
- [GitHub CLI (`gh`)](https://cli.github.com/) installed and authenticated
- Git installed and initialized
- Maven (`mvn`) or Maven Wrapper (`./mvnw`) available

## Usage
1. Place `release.sh` in the root of your Maven project.
2. Make it executable:
   ```sh
   chmod +x release.sh
   ```
3. Run the script:
   ```sh
   ./release.sh
   ```
4. Follow the interactive prompts to:
   - Choose version increment (patch, minor, major, or custom)
   - Enter commit message and release notes
   - Confirm and execute the release process

## Environment Variables (Optional)
- `VERSION_FILE`: Name of the version file (default: `VERSION`)
- `SKIP_TESTS`: Skip tests during build (default: `true`)
- `DEFAULT_STARTING_VERSION`: Version to use if no VERSION file exists (default: `1.0.0`)
- `UPLOAD_RETRY_COUNT`: Number of retry attempts for JAR upload (default: `3`)
- `UPLOAD_TIMEOUT`: Timeout in seconds for GitHub CLI operations (default: `300`)

## Example
```sh
./release.sh
```

## License
MIT

---

For more details, see the comments in `release.sh`. 