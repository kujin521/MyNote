## 登录功能

下表列出了登录Agile Application Server 的一般功能。

| **特征**                                         | **等效方法（S）**                     |
| ------------------------------------------------ | ------------------------------------- |
| 获取 Agile Application Server 会话的实例         | AgileSessionFactory.getInstance()     |
| 创建会话并登录敏捷应用服务器                     | AgileSessionFactory.createSession（） |
| 关闭会话并断开与 Agile Application Server 的连接 | IAgileSession.close()                 |

## 一般特点

下表列出了适用于所有 Agile PLM 业务对象的一般功能。

| **特征**                   | **等效方法（S）**                                     |
| -------------------------- | ----------------------------------------------------- |
| 创建一个新对象             | IAgileSession.createObject()                          |
| 加载现有对象               | IAgileSession.getObject()                             |
| 将一个对象另存为另一个对象 | IDataObject.saveAs()                                  |
| 删除对象                   | IDataObject.delete() IFolder.delete() IQuery.delete() |

| **特征**           | **等效方法（S）**                   |
| ------------------ | ----------------------------------- |
| 取消删除对象       | IDataObject.undelete()              |
| 获取对象的单元格值 | IDataObject.getValue()              |
| 设置对象的单元格值 | IDataObject.setValue()              |
| 获取对象的表       | IDataObject.getTable()              |
| 向表中添加一行     | ITable.createRow()                  |
| 从表中删除一行     | ITable.removeRow()                  |
| 获取对象的订阅     | ISubscribable.getSubscriptions()    |
| 启用订阅事件       | ISubscription.enable()              |
| 修改对象的订阅     | ISubscribable.modifySubscriptions() |

 

## 搜索功能

下表列出了支持的搜索（查询）功能。

| **特征**                                         | **等效方法（S）**                         |
| ------------------------------------------------ | ----------------------------------------- |
| 设置搜索名称                                     | IQuery.setName()                          |
| 将搜索设为公开或私密                             | IQuery.setQueryType()                     |
| 设置查询的搜索类型（对象搜索或 Where Used 搜索） | IQuery.setSearchType()                    |
| 设置和获取搜索条件                               | IQuery.setCriteria() IQuery.getCriteria() |
| 运行搜索                                         | IQuery.execute()                          |
| 使搜索区分大小写                                 | IQuery.setCaseSensitive()                 |
| 删除搜索                                         | IQuery.delete()                           |
| 将搜索另存为另一个搜索                           | IQuery.saveAs()                           |

##  附件功能

下表列出了用于处理附件和文件夹的功能。

| **特征**                       | **等效方法（S）**            |
| ------------------------------ | ---------------------------- |
| 下载文件夹中包含的所有文件     | IFileFolder.getFile()        |
| 下载附件选项卡上列出的单个文件 | IAttachmentFile.getFile()    |
| 检出文件夹                     | IFileFolder.checkOut()       |
| 签入文件夹                     | IFileFolder.checkIn()        |
| 取消结账                       | IFileFolder.cancelCheckOut() |

| **特征**                                     | **等效方法（S）**                        |
| -------------------------------------------- | ---------------------------------------- |
| 合并或取消合并一个项目，从而锁定或解锁其附件 | IAttachmentContainer.setIncorporated（） |

## 工作流功能

下表列出了用于处理附件和文件夹的功能。

| **特征**                       | **等效方法（S）**            |
| ------------------------------ | ---------------------------- |
| 下载文件夹中包含的所有文件     | IFileFolder.getFile()        |
| 下载附件选项卡上列出的单个文件 | IAttachmentFile.getFile()    |
| 检出文件夹                     | IFileFolder.checkOut()       |
| 签入文件夹                     | IFileFolder.checkIn()        |
| 取消结账                       | IFileFolder.cancelCheckOut() |

| **特征**                                     | **等效方法（S）**                        |
| -------------------------------------------- | ---------------------------------------- |
| 合并或取消合并一个项目，从而锁定或解锁其附件 | IAttachmentContainer.setIncorporated（） |

## 制造现场特点

下表列出了与制造现场合作的功能。

| **特征**                                       | **等效方法（S）**                                            |
| ---------------------------------------------- | ------------------------------------------------------------ |
| 获取为项目选择的当前制造地点                   | IManufacturingSiteSelectable.getManufacturingSite()          |
| 获取一个项目的所有制造地点                     | IManufacturingSiteSelectable.getManufacturingSites()         |
| 设置一个项目以使用所有制造站点                 | IManufacturingSiteSelectable.setManufacturi ngSite(ManufacturingSiteConstants.ALL_SITES) |
| 指定项目不是特定于站点的，而是所有站点通用的。 | IManufacturingSiteSelectable.setManufacturi ngSite（ManufacturingSiteConstants.COMMON_SITE） |
| 设置项目以使用特定的制造地点                   | IManufacturingSiteSelectable.setManufacturi ngSite(site)     |

## 文件夹功能

下表列出了用于处理文件夹的文件夹功能。

| **特征**                       | **等效方法（S）**       |
| ------------------------------ | ----------------------- |
| 将项目（例如查询）添加到文件夹 | IFolder.addChild()      |
| 设置文件夹类型（公共或私人）   | IFolder.setFolderType() |
| 设置文件夹名称                 | IFolder.setName()       |
| 获取当前用户的文件夹           | IUser.getFolder()       |
| 从文件夹中删除项目             | IFolder.removeChild()   |

| **特征**               | **等效方法（S）** |
| ---------------------- | ----------------- |
| 清除文件夹中的所有对象 | IFolder.clear()   |
| 删除文件夹             | IFolder.delete()  |

## 项目特色

下表列出了用于处理项目的功能。

| **特征**                       | **等效方法（S）**              |
| ------------------------------ | ------------------------------ |
| 将项目另存为另一个项目或模板   | IProgram.saveAs()              |
| 重新安排项目                   | IProgram.reschedule（）        |
| 从资源池分配用户               | IProgram.assignUsersFromPool() |
| 将项目的所有权委托给另一个用户 | IProgram.delegateOwnership()   |
| 替代项目资源                   | IProgram.substituteResource()  |
| 创建基线                       | IProgram.createBaseline()      |
| 选择项目的基线视图             | IProgram.selectBaseline()      |
| 锁定或解锁项目                 | IProgram.setLock()             |
| 回复讨论                       | IMessage.reply（）             |

## 行政特征

下表提供了在 Agile Java Client 中使用管理节点和属性的功能列表。

| **特征**                           | **等效方法（S）**                  |
| ---------------------------------- | ---------------------------------- |
| 获取行政管理节点                   | IAdmin.getNode()                   |
| 获取管理节点的所有子节点（子节点） | ITreeNode.getChildNodes()          |
| 获取管理节点的所有属性             | INode.getProperties()              |
| 获取管理节点的属性值               | IProperty.getValue()               |
| 获取列表字段的可能值               | IProperty.getAvailableValues()     |
| 获取所有敏捷 PLM 课程              | IAdmin.getAgileClasses(ALL)        |
| 获取所有顶级敏捷 PLM 类            | IAdmin.getAgileClasses(TOP)        |
| 获取所有可以实例化的 Agile PLM 类  | IAdmin.getAgileClasses（混凝土）   |
| 获取特定类的子类列表               | IAgileClass.getSubclasses()        |
| 获取一个子类的自动编号来源         | IAgileClass.getAutoNumberSources() |
| 获取表的属性数组·1                 | IAgileClass.getTableAttributes()   |
| 获取表的元数据                     | IAgileClass.getTableDescriptor（） |
| 获取敏捷 PLM 列表库                | IAdmin.getListLibrary()            |
| 创建新的敏捷 PLM 列表              | IListLibrary.createAdminList()     |

| **特征**                  | **等效方法（S）**                                          |
| ------------------------- | ---------------------------------------------------------- |
| 得到的Agile PLM列表       | IListLibrary.getAdminList()                                |
| 获取所有敏捷 PLM 用户     | 创建用户查询                                               |
| 获取所有 Agile PLM 用户组 | 创建用户组查询                                             |
| 创建用户或用户组          | IAgileSession.createObject()                               |
| 设置用户或用户组的属性    | IProperty.setValue()                                       |
| 更改用户密码              | IUser.changeApprovalPassword() IUser.changeLoginPassword() |