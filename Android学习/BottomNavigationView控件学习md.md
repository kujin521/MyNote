# as可直接生成底部导航
![1](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/%E5%BA%95%E9%83%A8%E5%AF%BC%E8%88%AA.png)

# 项目结构

![2](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/2.PNG)

## 注意
	menu->item->id 要和 navigation->fragment->id 保持一致<br>
	startDestination:启动页面
![3](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/3.PNG)

![4](https://raw.githubusercontent.com/kujin521/Typora_images/master/img/4.PNG)


### 核心代码
     private void setNav() {
        states = new int[][] {
                new int[] { android.R.attr.state_selected}, // 选中状态
                new int[] { android.R.attr.state_enabled}  // 未选中状态
        };
    
        colors = new int[] {
                Color.BLUE,
                Color.GRAY
        };
        ColorStateList myList = new ColorStateList(states, colors);
        BottomNavigationView navView = findViewById(R.id.nav_view);
        navView.setItemTextColor(myList);//设置item文字颜色
        navView.setItemIconTintList(myList);//设置item图片颜色
        NavController navController = Navigation.findNavController(this, R.id.nav_host_fragment);
        NavigationUI.setupWithNavController(navView, navController);
    }