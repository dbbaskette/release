# Generic Project Release Script

This project provides a robust, interactive Bash script (`release.sh`) to automate the release process for Maven or Gradle projects. It handles version management, builds, git operations, and GitHub releases in a single workflow.

## Features

- **Multi-Build Tool Support**: Works with both Maven and Gradle.
- **Dry Run Mode**: Preview the release process without making any changes using the `--dry-run` flag.
- **Configuration File**: Configure the script using a `.release.conf` file.
- **Changelog Generation**: Automatically generate release notes from your git commit history.
- **Interactive and Automated**: Run in interactive mode or automate it in your CI/CD pipeline.
- **Rollback**: Automatically roll back changes if the release fails.
- **Version Management**: Automatically increment patch, minor, or major versions, or specify a custom version.
- **Git Integration**: Automatically commits, tags, and pushes changes to your git repository.
- **GitHub Releases**: Automatically creates GitHub releases with your build artifacts.

## Prerequisites

- [Git](https://git-scm.com/)
- [GitHub CLI (`gh`)](https://cli.github.com/)
- [xmlstarlet](http://xmlstar.sourceforge.net/) (for Maven projects)
- A supported build tool (Maven or Gradle)

## Usage

1.  Place `release.sh` and `.release.conf` in the root of your project.
2.  Make the script executable:

    ```sh
    chmod +x release.sh
    ```

3.  Run the script:

    ```sh
    ./release.sh
    ```

### Dry Run

To see what the script will do without making any changes, use the `--dry-run` flag:

```sh
./release.sh --dry-run
```

## Configuration

The script can be configured using a `.release.conf` file. The following options are available:

- `VERSION_FILE`: The name of the file that stores the version number. (Default: `VERSION`)
- `SKIP_TESTS`: Whether to skip tests during the build. (Default: `true`)
- `DEFAULT_STARTING_VERSION`: The default version to use if no version file is found. (Default: `1.0.0`)
- `UPLOAD_RETRY_COUNT`: The number of times to retry uploading a release asset. (Default: `3`)
- `UPLOAD_TIMEOUT`: The timeout in seconds for GitHub CLI operations. (Default: `300`)
- `BUILD_TOOL`: The build tool to use (`maven` or `gradle`). The script will try to auto-detect if this is not set.
- `MAIN_BRANCH`: The main branch of the repository. (Default: `main`)

## License

MIT