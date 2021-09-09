## 连接到远程mongodb

```bash
mongo "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"
#新版
mongosh "mongodb+srv://<username>:<password>@<cluster>.mongodb.net/admin"
```

## 利用命令查找

```bash
#显示所有数据库
show dbs
#使用某一个数据库
use sample_training
#显示所有数据集合
show collections
#利用find 查找数据
db.zips.find({"state": "NY"})
```

```bash
db.zips.find({"state": "NY"}).count()

db.zips.find({"state": "NY", "city": "ALBANY"})

db.zips.find({"state": "NY", "city": "ALBANY"}).pretty()
```

