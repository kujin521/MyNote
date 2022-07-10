**环境设置：**

1. 节点版本 12。
2. 角度 Cli 8.1.
3. 文件保护程序 npm 模块。
4. xlsx npm 模块。

**步骤 1：下载 XLSX 模块。**

![img](https://miro.medium.com/max/60/1*Z7gTVwoog6TfsEWQvdpmGg.png?q=20)

![img](https://miro.medium.com/max/357/1*Z7gTVwoog6TfsEWQvdpmGg.png)

正在安装 xlsx 模块。

> *xlsx模块将有助于创建具有所需数据和文件名的.xlsx文件。*

**步骤2：下载文件保护程序模块。**

![img](https://miro.medium.com/max/60/1*9izWfloM5UDysufECv5DoQ.png?q=20)

![img](https://miro.medium.com/max/374/1*9izWfloM5UDysufECv5DoQ.png)

安装文件保护程序模块。

> *文件保存程序模块将有助于导出文件。*

**步骤3：创建"下载Excel"按钮。**

打开 company.component.html 并保存以下代码：

```
<a style="cursor: pointer" (click)="exportexcel()">
  <mat-icon> cloud_download</mat-icon>
</a>
```

> *这将在 UI 上创建下载按钮。*

**步骤 4：编写 exportexcel（） 方法。**

打开 company.component.ts 并保存以下代码：

```
import * as XLSX from 'xlsx'; 

export class AppComponent {
	
/*name of the excel-file which will be downloaded. */ 
fileName= 'ExcelSheet.xlsx';  

exportexcel(): void 
    {
       /* table id is passed over here */   
       let element = document.getElementById('excel-table'); 
       const ws: XLSX.WorkSheet =XLSX.utils.table_to_sheet(element);

       /* generate workbook and add the worksheet */
       const wb: XLSX.WorkBook = XLSX.utils.book_new();
       XLSX.utils.book_append_sheet(wb, ws, 'Sheet1');

       /* save to file */
       XLSX.writeFile(wb, this.fileName);
			
    }
}
```

> *此方法用于下载 excel 文件 。在这里，我们传递表的表ID，我们必须从中将数据带入excel文件。在这里，您可以看到表ID是****"excel-table"。\***

**步骤5：将从中下载数据的HTML表。**

打开 company.component.html 并保存以下代码：

```
<table id="excel-table"> 
    <tr>       
       <th>ContainerNo</th> 
       <th>SelCondition</th>  
       <th> ContainerCondition</th> 
       <th>GateInDateTime</th>   
    </tr>    
    <tr *ngFor="let sup of Company">
    // This is the binding part. 
       <td>{{ sup.ContainerNo }}</td>  
       <td>{{ sup.SelCondition }}</td> 
       <td>{{ sup.ContainerCondition }}</td> 
       <td>{{ sup.GateInDateTime }}</td> 
    </tr> 
</table>
```

> *此处*将 '***id="excel-table"\*** *传递到此处，然后将相同的 id 引用到 export excel 方法 。这样，我们将在excel文件中获取表数据。*

```
221090208

```

