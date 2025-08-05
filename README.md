# Triangle

<img src="https://raw.githubusercontent.com/wangwenyou/Triangle/main/logo.png" style="width:64px"/> 

A lightweight macOS utility that enables seamless mouse looping across multiple screens. When your mouse cursor reaches the edge of your outermost screen, it will instantly warp to the corresponding edge of the opposite outermost screen, creating an infinite desktop experience.

Existing macOS tools like CatchMouse rely on keyboard shortcuts for screen jumping, which can interrupt workflow. Scripting solutions like Hammerspoon, while powerful, often suffer from environment and permission issues, making troubleshooting difficult. This lightweight tool aims to provide a seamless and hassle-free mouse cycling experience without these limitations.

## Features

*   **Multi-Screen Cycling**: Effortlessly move your mouse from the rightmost screen to the leftmost, and vice-versa.
*   **Lightweight & Native**: Built with Swift and AppKit for optimal performance and seamless integration with macOS.
*   **Menu Bar App**: Runs quietly in the background, accessible via a discreet menu bar icon.
*   **Accessibility Integration**: Prompts for necessary Accessibility permissions to control the mouse cursor.

## Installation

Once the application is built (or a pre-built `.app` is provided):

1.  Download the `Triangle.app` file.
2.  Drag `Triangle.app` into your `/Applications` folder.
3.  Launch `Triangle.app`.
4.  The first time you run it, you will be prompted to grant **Accessibility** permissions. Follow the on-screen instructions to navigate to `System Settings > Privacy & Security > Accessibility` and enable `Triangle`.

## Building from Source

To build `Triangle` from source, you will need Xcode installed on your macOS system.

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/your-username/Triangle.git
    cd Triangle
    ```
2.  **Open the project in Xcode:**
    ```bash
    open Triangle.xcodeproj
    ```
3.  **Build the project:**
    In Xcode, select `Product > Build` (or `⌘B`). The `Triangle.app` will be generated in the `Products` folder within Xcode's build directory.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

# Triangle (中文)

<img src="https://raw.githubusercontent.com/wangwenyou/Triangle/main/logo.png" style="width:64px"/> 

一个轻量级的 macOS 工具，旨在实现鼠标在多屏幕间的无缝循环移动。当您的鼠标光标到达最外侧屏幕的边缘时，它将立即传送到另一侧最外侧屏幕的对应边缘，从而创造一个无限循环的桌面体验。

Mac 上现有的工具，例如 CatchMouse，通常依赖快捷键来切换屏幕，这可能会打断工作流程。而像 Hammerspoon 这样的脚本解决方案，虽然功能强大，但常常受限于环境和权限问题，导致排查困难。因此，我们开发了这款轻量级工具，旨在提供一种无缝且无忧的鼠标循环体验，避免上述限制。

## 功能特性

*   **多屏循环**: 轻松地将鼠标从最右侧屏幕移动到最左侧，反之亦然。
*   **轻量原生**: 使用 Swift 和 AppKit 构建，以实现最佳性能并与 macOS 无缝集成。
*   **菜单栏应用**: 在后台静默运行，通过一个不显眼的菜单栏图标进行访问。
*   **辅助功能集成**: 首次运行时会提示您授予必要的辅助功能权限以控制鼠标光标。

## 安装

应用程序构建完成后（或提供预构建的 `.app` 文件后）：

1.  下载 `Triangle.app` 文件。
2.  将 `Triangle.app` 拖放到您的 `/Applications` 文件夹中。
3.  启动 `Triangle.app`。
4.  首次运行时，系统会提示您授予**辅助功能**权限。请按照屏幕上的说明导航到 `系统设置 > 隐私与安全性 > 辅助功能` 并启用 `Triangle`。

## 从源代码构建

要从源代码构建 `Triangle`，您的 macOS 系统需要安装 Xcode。

1.  **克隆仓库：**
    ```bash
    git clone https://github.com/your-username/Triangle.git
    cd Triangle
    ```
2.  **在 Xcode 中打开项目：**
    ```bash
    open Triangle.xcodeproj
    ```
3.  **构建项目：**
    在 Xcode 中，选择 `Product > Build` (或 `⌘B`)。`Triangle.app` 将在 Xcode 构建目录的 `Products` 文件夹中生成。

## 许可证

本项目采用 MIT 许可证 - 有关详细信息，请参阅 [LICENSE](LICENSE) 文件。
