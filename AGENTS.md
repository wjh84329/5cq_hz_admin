# AGENTS.md

## 1. 适用范围

本文件适用于 `D:\5CQ项目\5cq_hz_admin` 项目。

这是一个基于 `ThinkPHP 6` 的 PHP 后端项目，包含：

- 后台管理
- 用户侧接口
- WebSocket / Worker
- 队列任务
- 微信能力
- 短信能力
- 数据库业务逻辑

处理本项目时，默认目标是：先读结构，再定位入口，再做最小改动，最后做只读验证。

---

## 2. 项目结构速览

关键目录：

- `app/`
- `config/`
- `route/`
- `public/`
- `view/`
- `database/`

`app/` 下重点模块：

- `app/admin`：后台管理模块
- `app/cq`：站点接口、业务接口、用户接口
- `app/http`：Worker / HTTP 服务
- `app/worker`：事件处理
- `app/service`：服务类、推送能力
- `app/middleware`：全局中间件

优先阅读文件：

- `composer.json`
- `route/app.php`
- `config/database.php`
- `config/worker_server.php`
- `config/gateway_worker.php`
- `config/queue.php`
- `app/cq/controller/*.php`
- `app/worker/Events.php`
- `app/service/GatewayPush.php`
- `app/http/WorkerServer.php`

---

## 3. 工作原则

### 3.1 先读后改

修改前必须先确认：

- 当前问题对应的控制器或服务文件
- 路由入口
- 调用链上下游
- 相关配置文件

禁止在未看清调用关系时直接改业务逻辑。

### 3.2 最小改动

默认遵循：

- 只改当前任务相关文件
- 只改当前问题相关逻辑
- 尽量不改已有字段名、方法名、返回结构
- 不顺手做无关重构

### 3.3 保持兼容

后端改动要优先保证：

- 接口返回字段兼容
- 错误码兼容
- WebSocket 消息结构兼容
- 缓存键兼容

如确需新增字段，优先追加，不要直接替换旧字段。

---

## 4. 推荐排查顺序

### 4.1 普通接口问题

建议顺序：

1. `route/`
2. `app/cq/controller/` 或 `app/admin/controller/`
3. `app/service/`
4. 相关配置文件
5. 前端调用来源

### 4.2 WebSocket / 实时推送问题

优先查看：

1. `app/worker/Events.php`
2. `app/service/GatewayPush.php`
3. `app/http/WorkerServer.php`
4. `config/worker_server.php`
5. `config/gateway_worker.php`

### 4.3 队列 / 异步任务问题

优先查看：

1. `config/queue.php`
2. `app/Job/`
3. `app/cq/Job/`
4. 相关控制器触发点

---

## 5. 数据库操作规则

### 5.1 默认只允许 `SELECT`

在没有用户明确确认之前，数据库操作只允许只读查询，包括但不限于：

- `SELECT`
- 只读统计查询
- 只读联表查询
- `EXPLAIN`

### 5.2 以下操作必须先询问用户

执行前必须先询问并得到明确确认：

- `INSERT`
- `UPDATE`
- `DELETE`
- `REPLACE`
- `ALTER`
- `CREATE`
- `DROP`
- `TRUNCATE`
- `RENAME`
- 存储过程执行
- 迁移脚本执行
- 初始化脚本执行
- 批量导入或批量修复

即使是本地库、测试库、开发库，也不能直接执行。

### 5.3 代码中的写库逻辑

允许：

- 阅读写库代码
- 修改写库代码
- 输出 SQL 草案

不允许：

- 未经确认直接触发真实写库行为
- 为了验证逻辑擅自执行写入、更新、删除

---

## 6. 文件操作规则

### 6.1 删除文件只能单个删除

任何删除动作都必须满足：

- 一次只能删除一个文件
- 不能批量删除
- 不能递归删目录
- 不能按通配符删除一组文件

### 6.2 删除文件只能移动到回收站

允许的删除方式只有：

- 将单个文件移动到系统回收站

禁止：

- 永久删除
- 绕过回收站删除
- 强制清理目录
- 清空回收站

### 6.3 删除前必须确认

删除前必须先确认：

- 该文件是否仍在被引用
- 是否只是历史备份
- 用户是否明确同意删除

如果不能确认，默认不删。

---

## 7. Git 与现有改动规则

- 不回滚用户已有改动
- 不覆盖来源不明的修改
- 禁止使用 `git reset --hard`
- 禁止使用 `git checkout -- <file>`
- 禁止使用会丢失未提交内容的清理命令

若同一文件存在他人改动，应先阅读并兼容，再补丁式修改。

---

## 8. 修改建议

处理本项目时，优先从这些位置入手：

- 业务接口：`app/cq/controller/`
- 后台逻辑：`app/admin/controller/`
- 推送与联动：`app/service/`、`app/worker/`
- 配置：`config/`

如果问题涉及用户中心、任务、抽奖、背包、红包、金币等业务，优先先查控制器，再查服务类，再查推送链路。

---

## 9. 验证要求

改动完成后，至少完成以下检查中的若干项：

- PHP 语法检查
- 路由入口核对
- 返回结构核对
- 异常分支自查
- WebSocket 消息流向核对

如果有未验证项，必须明确说明。

---

## 10. 强制红线

以下规则必须严格执行：

1. 数据库默认只能执行 `SELECT`。
2. 任何写库操作都必须先询问用户。
3. 删除文件只能单个删除。
4. 删除文件只能移动到回收站，不能永久删除。
5. 不得批量删除、递归删目录。
6. 不得回滚未确认的现有改动。
