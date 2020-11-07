# Linux 数据库安装指南

表 1-1 Oracle 数据库安装的服务器硬件清单

| 检查                 | 任务                                                         |
| :------------------- | :----------------------------------------------------------- |
| 服务器制作和体系结构 | 确认支持服务器制造、模型、核心体系结构和主机总线适配器 （HBA） 或网络接口控制器 （NIC） 使用 Oracle 数据库和 Oracle 网格基础结构运行。 |
| 运行级别             | 3 或 5                                                       |
| 服务器显示卡         | 至少 1024 x 768 的显示分辨率，这是 Oracle 通用安装程序所需的。 |
| 最小网络连接         | 服务器已连接到网络                                           |
| 最小内存             | 用于 Oracle 数据库安装的至少 1 GB RAM。建议使用 2 GB 内存。用于 Oracle 网格基础结构安装的至少 8 GB RAM。 |

表1-2 Linux上甲骨文数据库操作系统总清单

|                         项目                         | 任务                                                         |
| :--------------------------------------------------: | :----------------------------------------------------------- |
|                   操作系统一般要求                   | 如果尚未将其作为默认 Linux 安装的一部分安装，请手动安装 OpenSSH。本指南中列出的受支持的内核和版本列表中的 Linux 内核。 |
|              Linux x86-64 操作系统要求               | 支持以下 Linux x86-64 内核：Oracle Linux 7.5 具有牢不可破的企业内核 5： 4.14.35-1818.5.3.el7uek.x86_64 或更晚的 Oracle Linux 7.2 与牢不可破的企业内核 4： 4.1.12- 32.2.3.el7uek.x86_64或更 晚的 Oracle Linux 7 与牢不可破的企业内核 3： 3.8.13-35.3.1.el7uek.x86_64 或更晚 的 Oracle Linux 7 与红帽兼容内核： 3.10.0-123.el7.x86_64 或更晚红帽企业 Linux 7： 3.10.0-123.el7.x86_64或更晚 Oracle Linux 6.4 与牢不可破的企业内核 2： 2.6.39-400.211.1.el6uek.x86_64or 以后的 Oracle Linux 6.6 与牢不可破的企业内核 3： 3.8.13 - 44.1.1.el6uek.x86_64 或更晚 Oracle Linux 6.8 具有牢不可破的企业内核 4： 4.1.12-37.6.2.el6uek.x86_64 或更晚的 Oracle Linux 6.4 与红帽兼容内核： 2.6.32-358.el6.x86_64 或更晚 红帽企业 Linux 6.4： 2.6.32-358.el6.x86_64或更晚 SUSE Linux 企业服务器 12 SP1： 3.12.49-11.1 或更晚查看系统要求部分，查看最低包要求列表。 |
|          IBM：Linux 对系统 z 操作系统的要求          | 支持以下 IBM： 支持系统 z 内核上的 Linux：红帽企业 Linux 7.2： 3.10.0-327.el7.s390x 或更晚 红帽企业 Linux 6.6： 2.6.32-504.el6.s390x 或更晚 SUSE Linux 企业服务器 12 SP1： 3.12.49-11 默认 s390x 或更晚查看系统要求部分，查看最低包要求列表。 |
|        用于 Oracle Linux 的 Oracle 预安装 RPM        | 如果使用 Oracle Linux，则 Oracle 建议您为 Linux 版本运行 Oracle 预安装 RPM，以便为 Oracle 数据库和 Oracle 网格基础结构安装配置操作系统。 |
| Ibm 的 Oracle RPM 检查器实用程序： 系统 z 上的 Linux | Oracle 建议您在启动 Oracle 数据库或 Oracle 网格基础结构安装之前，使用 Oracle RPM 检查程序实用程序验证 IBM 上是否安装了所需的红帽企业 Linux 或 SUSE 软件包：System z 操作系统上的 Linux。 |
|                     禁用透明大页                     | Oracle 建议您禁用透明大页并使用标准 HugePage 来增强性能。    |

表 1-3 Oracle 数据库的服务器配置清单

| 检查                                                         | 任务                                                         |
| :----------------------------------------------------------- | :----------------------------------------------------------- |
| 分配给目录的磁盘空间`/tmp`                                   | 目录中至少 1 GB 的空间。`/tmp`                               |
| 相对于 RAM（Oracle 数据库）交换空间分配                      | 1 GB 和 2 GB 之间的 1.5 倍的 RAM 大小介于 2 GB 和 16 GB 之间：等于 RAM 的大小 大于 16 GB： 16 GB**注意：**如果您为 Linux 服务器启用 HugePages，那么在计算交换空间之前，应从可用 RAM 中扣除分配给 HugePages 的内存。 |
| 相对于 RAM 交换空间分配（Oracle 重新启动）                   | 8 GB 和 16 GB 之间：等于 RAM 的大小超过 16 GB：  16 GB**注意：**如果您为 Linux 服务器启用 HugePages，则在计算交换空间之前，应从可用 RAM 中扣除分配给 HugePages 的内存。 |
| 甲骨文库存（或发明）和 OINSTALL 集团要求                     | 对于升级，Oracle 通用安装程序 （OUI） 从文件中检测现有的 oraInventory 目录，并使用现有的 oraInventory。`/etc/oraInst.loc`对于新安装，如果您尚未配置 oraInventory 目录，则可以在软件安装期间指定 oraInventory 目录，Oracle 通用安装程序将为你设置软件目录。Oracle 清单是 Oracle 软件安装库的一个目录级别，将安装所有者的主要组指定为 Oracle 清单组。确保指定的 oraInventory 路径符合 Oracle 最佳灵活体系结构建议。Oracle 清单目录是安装在您系统上的 Oracle 软件的中央清单。将 Oracle 清单组作为主组的用户被授予 OINSTALL 权限，以便写入中央清单。OINSTALL 组必须是服务器上所有 Oracle 软件安装所有者的主要组。任何 Oracle 安装所有者都应可以写入它。 |
| 组和用户                                                     | Oracle 建议您在开始安装之前创建安全计划所需的组和用户帐户。安装所有者具有资源限制设置和其他要求。组和用户名必须仅使用 ASCII 字符。 |
| 安装软件二进制文件的点路径                                   | Oracle 建议您创建最佳灵活体系结构配置，如 Oracle 数据库安装指南中附录中的附录*"最佳灵活体系结构"中所述*。 |
| 确保 Oracle 主页（您为 Oracle 数据库选择的 Oracle 主路径）仅使用 ASCII 字符 | ASCII 字符限制包括安装所有者用户名，这些用户名用作某些主路径的默认值，以及您可以为路径选择的其他目录名称。 |
| 未设置 Oracle 软件环境变量                                   | 如果您有现有的 Oracle 软件安装，并且使用同一用户来安装此安装，则取消设置以下环境变量： 、和 。`$ORACLE_HOME``$ORA_NLS10``$TNS_ADMIN`如果已设置为环境变量，则在开始安装或升级之前解套它。除非由 Oracle 支持人员指示，否则不要用作用户环境变量。`$ORA_CRS_HOME``$ORA_CRS_HOME` |
| 确定用于安装的超级用户 （） 权限委派选项`root`               | 在数据库或网格基础结构安装过程中，系统会要求您以用户状态运行配置脚本。`root`在网格基础结构安装期间，您可以像在提示时一样手动运行这些脚本，或者可以使用根权限委派选项提供配置信息和密码。`root`若要自动运行脚本，请选择"**在安装过程中自动运行配置**脚本"。`root`**使用根用户凭据**为群集成员节点服务器提供超级用户密码。**使用苏多**Sudo 是一个 UNIX 和 Linux 实用程序，它允许 Sudoers 列表权限的成员作为 运行单个命令。提供作为 sudoers 成员的操作系统用户的用户名和密码，并有权在每个群集成员节点上运行 Sudo。`root`若要启用 Sudo，请让具有相应权限的系统管理员配置作为 Sudoers 列表成员的用户，并在安装过程中提示时提供用户名和密码。 |
| 设置区域设置（如果需要）                                     | 指定要使用 Oracle 组件的语言和区域设置。区域设置是运行系统或程序的语言和文化环境。NLS（国家语言支持）参数确定服务器和客户端上特定于区域设置的行为。组件的区域设置确定组件的用户界面的语言以及全球化行为，如日期和数字格式。 |
| 检查共享内存文件系统装载                                     | 默认情况下，您的操作系统包括一个条目来装载 。但是，如果您的群集验证实用程序 （CVU） 或 Oracle 通用安装程序 （OUI） 检查失败，请确保装载区域的类型，并安装以下选项：`/etc/fstab``/dev/shm``/dev/shm``tmpfs``rw`和权限设置`exec`没有或设置它`noexec``nosuid`注：这些选项可能不会列出，因为它们通常作系统设置为默认权限。 |

表 1-4 Oracle 数据库的用户环境配置

| 检查                                           | 任务                                                         |
| :--------------------------------------------- | :----------------------------------------------------------- |
| 查看 Oracle 清单（或发明）和 OINSTALL 集团要求 | 指定为 Oracle 清单目录的物理组是安装在您的系统上的 Oracle 软件的中央清单。它应该是所有 Oracle 软件安装所有者的主要组。将 Oracle 清单组作为其主要组的用户被授予 OINSTALL 读取和写入中央清单的权限。如果您有现有安装，则 OUI 会检测来自`/etc/oraInst.loc 文件中的现有 oraInventory 目录`，并使用此位置。如果您是首次安装 Oracle 软件，则可以在 Oracle 软件安装期间指定 Oracle 清单目录和 Oracle 基础目录，并且 Oracle 通用安装程序将为此设置软件目录。确保指定的目录路径符合 Oracle 最佳灵活体系结构建议。确保指定为 OINSTALL 组的组作为所有计划好的 Oracle 软件安装所有者的主要组可用。 |
| 为标准或角色分配的系统权限创建操作系统组和用户 | 创建操作系统组和用户，具体取决于您的安全要求，如本安装指南所述。为 Oracle 软件安装所有者设置资源限制设置和其他要求。组和用户名必须仅使用 ASCII 字符。 |
| 未设置 Oracle 软件环境变量                     | 如果您的系统已安装现有，并且使用此安装使用相同的用户帐户，则取消设置 ORACLE_HOME、ORACLE_BASE、ORACLE_SID、TNS_ADMIN 环境变量和与 Oracle 软件家庭连接的 Oracle 安装用户的所有其他环境变量集。 |
| 配置 Oracle 软件所有者环境                     | 通过执行以下任务配置 或 用户的环境：`oracle``grid`在 shell 启动文件中将默认文件模式创建掩码 （） 设置为 022。`umask`设置环境变量。`DISPLAY` |

表 1-7 Oracle 数据库的部署清单（单实例）

| 项目                                             | 任务                                                         |
| :----------------------------------------------- | :----------------------------------------------------------- |
| 部署单实例 Oracle 数据库软件                     | 使用以下部署方法之一：使用 Oracle 通用安装程序 （OUI） 安装 Oracle 数据库软件。使用快速主页预配预配 Oracle 数据库软件。克隆 Oracle 数据库。 |
| 部署单实例 Oracle 数据库软件并创建数据库         | 使用以下部署方法之一：使用 Oracle 通用安装程序 （OUI） 安装 Oracle 数据库软件。使用快速主页预配预配 Oracle 数据库软件。克隆 Oracle 数据库。 |
| 在已安装的 Oracle 家庭中创建单实例 Oracle 数据库 | 使用 Oracle 数据库配置助手（Oracle DBCA）。使用快速家庭配置  |

## 使用 ULN 支持安装 Oracle 预安装 RPM

https://docs.oracle.com/en/database/oracle/oracle-database/18/ladbi/automatically-configuring-oracle-linux-with-oracle-preinstallation-rpm.html#GUID-22846194-58EF-4552-AAC3-6F6D0A1DF794

编写环境变量

```
export命令显示当前系统定义的所有环境变量
echo $PATH命令输出当前的PATH环境变量的值
```



```
TMP=/tmp; export TMP
TMPDIR=$TMP; export TMPDIR
ORACLE_HOSTNAME=testlab.com.bd; export ORACLE_HOSTNAME
ORACLE_BASE=/opt/oracle; export ORACLE_BASE
ORACLE_HOME=$ORACLE_BASE/product/18c/dbhome_1; export ORACLE_HOME
ORACLE_SID=orcl; export ORACLE_SID
ORACLE_UNQNAME=orcl; export ORACLE_UNQNAME
ORACLE_TERM=xterm; export ORACLE_TERM
BASE_PATH=/usr/sbin:$PATH; export BASE_PATH
PATH=$ORACLE_HOME/bin:$GRID_HOME/bin:$BASE_PATH; export PATH
LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib; export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib; export CLASSPATH
```

