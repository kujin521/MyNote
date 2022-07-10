## 使用 ViewModel 处理配置更改

ViewModel 非常适合在用户积极使用应用程序时存储和管理与 UI 相关的数据。它允许快速访问 UI 数据，并帮助您避免通过旋转、窗口调整和其他常见发生的配置更改从网络或磁盘重新提取数据。若要了解如何实现视图模型，请参阅[视图模型指南](https://developer.android.com/topic/libraries/architecture/viewmodel.html)。

ViewModel 将数据保留在内存中，这意味着检索比从磁盘或网络中检索数据更便宜。ViewModel 与活动（或其他一些生命周期所有者）关联 - 它在配置更改期间保留在内存中，系统会自动将 ViewModel 与配置更改导致的新活动实例关联。

当用户退出活动或片段时，或者当您调用 finish（）时，ViewModels 会自动被系统销毁，这意味着状态将按用户在这些方案中的期望进行清除。

与保存的实例状态不同，ViewModels 在系统启动的进程死亡期间被销毁。这就是为什么您应该将 ViewModel 对象与 onSaveInstanceState（或其他一些磁盘持久性）结合使用，将标识符隐藏到保存的 InstanceState 中，以帮助查看模型在系统死亡后重新加载数据。

如果您已经拥有用于跨配置更改存储 UI 状态的内存中解决方案，则可能不需要使用 ViewModel。

### 博客

- [视图模型 ：一个简单的示例](https://medium.com/androiddevelopers/viewmodels-a-simple-example-ed5ac416317e)
- [视图模型：持久性、在保存状态（）、还原 UI 状态和加载器](https://medium.com/androiddevelopers/viewmodels-persistence-onsaveinstancestate-restoring-ui-state-and-loaders-fc7cc4a6c090)
- [Android 生命周期感知组件代码实验室](https://codelabs.developers.google.com/codelabs/android-lifecycles/)

