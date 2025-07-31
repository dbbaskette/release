<div align="center">
  <a href="https://github.com/dbbaskette/release">
    <img src=".github/assets/release.png" alt="Logo" width="80" height="80">
  </a>

  <h3 align="center">Project Release Script</h3>

  <p align="center">
    A robust, interactive Bash script to automate the release process for your projects.
    <br />
    <a href="https://github.com/dbbaskette/release/issues">Report Bug</a>
    ·
    <a href="https://github.com/dbbaskette/release/issues">Request Feature</a>
  </p>
</div>

## About The Project

This project provides a powerful and flexible Bash script (`release.sh`) designed to streamline and automate the release workflow for Maven or Gradle projects. It simplifies version management, build processes, Git operations, and GitHub releases into a single, easy-to-use command.

### Key Features

*   🚀 **Self-Updating**: The script automatically downloads the latest version of itself, ensuring you always have the most recent features and bug fixes.
*   🛠️ **Maven & Gradle Support**: Seamlessly works with both Maven and Gradle build tools.
*   🧪 **Dry Run Mode**: Preview the entire release process without making any actual changes using the `--dry-run` flag.
*   ⚙️ **Flexible Configuration**: Customize the script's behavior using a simple `.release.conf` file.
*   📝 **Automated Changelog**: Generate release notes automatically from your Git commit history.
*   🔄 **Interactive or Automated**: Run in an interactive mode for guided releases or automate it completely in your CI/CD pipelines.
*   롤 **Automatic Rollback**: In case of a failure, the script will automatically roll back any changes to ensure your repository remains in a clean state.
*   🏷️ **Smart Version Management**: Automatically increment patch, minor, or major versions, or specify a custom version for your release.
*   📦 **Git & GitHub Integration**: Handles all Git operations (commit, tag, push) and creates GitHub releases with your build artifacts.
*   🔌 **Extensible with Plugins**: Add your own custom logic to the release process using pre-release and post-release plugin hooks.

## How It Works

The `release.sh` script is a lightweight wrapper that handles the self-updating mechanism. When you run it, it performs the following steps:

1.  **Downloads the latest version**: It fetches the latest version of the main release script (`.release-exec`) from the official repository.
2.  **Updates `.gitignore`**: It ensures that the `release.sh` and `.release-exec` files are included in your `.gitignore` to avoid committing them to your repository.
3.  **Executes the script**: It runs the downloaded `.release-exec` script, passing along any arguments you provided.

If the script cannot download the latest version, it will fall back to using a local cached version of `.release-exec` if one is available.

## Getting Started

To get started, follow these simple steps.

### Prerequisites

*   [Git](https://git-scm.com/)
*   [GitHub CLI (`gh`)](https://cli.github.com/)
*   [xmlstarlet](http://xmlstar.sourceforge.net/) (for Maven projects)
*   A supported build tool (Maven or Gradle)

### Installation

1.  Place `release.sh` and `.release.conf` in the root of your project.
2.  Make the script executable:
    ```sh
    chmod +x release.sh
    ```
3.  Run the script:
    ```sh
    ./release.sh
    ```

## Configuration

The script can be configured using a `.release.conf` file in the root of your project. The following options are available:

| Variable                   | Description                                                                                             | Default     |
| -------------------------- | ------------------------------------------------------------------------------------------------------- | ----------- |
| `VERSION_FILE`             | The name of the file that stores the version number.                                                    | `VERSION`   |
| `SKIP_TESTS`               | Whether to skip tests during the build.                                                                 | `true`      |
| `DEFAULT_STARTING_VERSION` | The default version to use if no version file is found.                                                 | `1.0.0`     |
| `UPLOAD_RETRY_COUNT`       | The number of times to retry uploading a release asset.                                                 | `3`         |
| `UPLOAD_TIMEOUT`           | The timeout in seconds for GitHub CLI operations.                                                       | `300`       |
| `BUILD_TOOL`               | The build tool to use (`maven` or `gradle`). The script will try to auto-detect if this is not set.      | `""`        |
| `MAIN_BRANCH`              | The main branch of the repository.                                                                      | `main`      |

## Plugins

You can extend the functionality of the release script by adding your own custom shell scripts to the `plugins/pre-release` or `plugins/post-release` directories.

*   **Pre-release plugins**: These scripts are executed after the version has been updated but before the build and release process begins.
*   **Post-release plugins**: These scripts are executed after the release has been successfully completed.

Any executable shell script in these directories will be run automatically in alphabetical order.

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## License

Distributed under the MIT License. See `LICENSE` for more information.
