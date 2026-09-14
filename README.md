# hiauhong's Homebrew tap

[![Vibe coded](https://img.shields.io/badge/vibe-coded-%23ff69b4?style=flat-square)](https://en.wikipedia.org/wiki/Vibe_coding)

个人 Homebrew tap：存放我自己的 macOS CLI 工具公式。两个公式都**只分发预编译二进制**（Apple Silicon），安装时不编译任何东西，因此**不需要 Xcode**。

> 🎨 本项目由 **vibe coding**(AI 辅助开发)驱动——功能、测试与文档均在 AI agent 协作下迭代产出。

## 安装

```sh
brew install hiauhong/tap/remindkit   # Apple Reminders 数据管道 CLI
brew install hiauhong/tap/notekit     # Apple Notes 数据管道 CLI
```

等价写法（先 tap 再加）：

```sh
brew tap hiauhong/tap
brew install remindkit notekit
```

## 可用公式

| 公式 | 说明 | 源码仓库 |
|---|---|---|
| `remindkit` | Apple Reminders（提醒事项）全层级读写 CLI：列表文件夹 → 列表 → 分区 → 任务 → 子任务。读走 `ReminderKit.framework`，统一 JSON 输出，面向 AI agent | [hiauhong/remindkit-cli](https://github.com/hiauhong/remindkit-cli) |
| `notekit` | Apple Notes（备忘录）完整读写 CLI：导出 / 搜索 / 新建 / 修改 / 移动 / 删除。走 AppleScript 公开 API，免「完全磁盘访问」 | [hiauhong/notekit-cli](https://github.com/hiauhong/notekit-cli) |

## 环境要求

- **Apple Silicon（arm64）**：两个公式都未发布 x86_64 二进制，Intel Mac 上安装会直接报错并提示改用源码构建。
- **macOS**：依赖系统提醒事项 / 备忘录数据，仅支持 macOS。
- **权限（TCC）**：首次运行按系统提示授权——`remindkit` 需要「提醒事项」访问权限，`notekit` 需要「自动化 → 控制 Notes」权限。两者都**不需要** macOS「完全磁盘访问」；权限归属于宿主进程（终端 / agent 宿主）。

装好后建议先跑各自的自检：

```sh
remindkit doctor    # 检查权限与数据源
notekit doctor      # 检查权限（首次会弹授权框，点「允许」）
```

## 升级 / 卸载

```sh
brew upgrade remindkit     # 或 notekit
brew uninstall remindkit   # 或 notekit
```

## 关于本仓库

- `Formula/*.rb` 由各项目**自己的发版流水线自动改写**（推 `v*` tag → 构建 → 发 Release → 更新公式），请勿手动编辑，手工改动会在下次发版时被覆盖。
- 公式均从对应仓库的 GitHub Release 下载预编译产物；文件与源码仓库一一对应，问题请提到源码仓库而非本 tap。
