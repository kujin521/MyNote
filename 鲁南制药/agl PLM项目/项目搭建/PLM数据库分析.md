## 项目历史记录表

#### 存储活动、门和讨论对象的历史日志。

| **Column**      | **Type** | **Comments**                             |
| --------------- | -------- | ---------------------------------------- |
| ID              | NUMBER   | 唯一身份                                 |
| OBJ_ID          | NUMBER   | 关联对象的 ID（活动、门或讨论）          |
| CLASS_ID        | NUMBER   | 关联对象的类 ID（活动、门或讨论）        |
| USER_ID         | NUMBER   | 执行操作的用户 ID                        |
| TIMESTAMP       | DATE     | 采取行动的服务器日期                     |
| ACTION          | NUMBER   | 行动类型                                 |
| DETAILS         | VARCHAR2 | 对象详细信息                             |
| COMMENTS        | VARCHAR2 | 用户评论                                 |
| LOCAL_DATE      | DATE     | 本地日期                                 |
| DELETE_FLAG     | NUMBER   | 识别该对象是否被软删除。软删除的值为 1。 |
| CREATE_DATE     | DATE     | Create Date                              |
| UPDATE_DATE     | DATE     | Update Date                              |
| RICHTEXTVERSION | VARCHAR2 |                                          |

## ODM_TEAM

存储与程序关联的资源信息。

| **Column**           | **Type** | **Comments**                                        |
| -------------------- | -------- | --------------------------------------------------- |
| ACTIVITY_ID          | NUMBER   | 关联活动的 ID                                       |
| USER_ID              | NUMBER   | 添加到活动团队的用户 ID                             |
| RESOURCE_TYPE        | NUMBER   | 指定用户或用户组。0（用户）/1（用户团体）           |
| FROM_POOL_ID         | NUMBER   | 用户所在的资源池 ID分配给团队                       |
| PERCENT_ALLOC        | NUMBER   | 为用户分配的百分比活动                              |
| ID                   | NUMBER   | 指定用户是活动的资源还是不是。0（非资源）/1（资源） |
| ISRESOURCE_ID        | NUMBER   | 指定用户是否拒绝分配 活动 0（未拒绝）/ 1（拒绝      |
| REJECTED_FLAG_ID     | NUMBER   | 指定用户是否拒绝分配 活动 0（未拒绝）/ 1（拒绝）    |
| ACTUAL_HOURS         | NUMBER   | 实际上班时间                                        |
| LABOR_RATE_VALUE     | NUMBER   | 劳动率值                                            |
| LABOR_RATE_ CURRENCY | NUMBER   | 以货币计的劳动率                                    |
| DELETE_FLAG          | NUMBER   | 识别该对象是否被软删除。软删除的值为 1。            |
| CREATE_DATE          | DATE     | 创建日期                                            |
| UPDATE_DATE          | DATE     | 更新日期                                            |





