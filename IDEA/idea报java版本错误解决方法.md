<div class="htmledit_views" id="content_views">
                                            <p>&nbsp; &nbsp; &nbsp; &nbsp;在Intellij idea中新建了一个Maven项目，运行时报错如下：<span style="color:#f33b45;">Error : java 不支持发行版本5</span></p>

<p><img alt="" class="has" height="153" src="https://img-blog.csdn.net/20180904232438840?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIyMDc2MzQ1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" width="832"></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;本地运行用的是JDK9，测试Java的Stream操作，报错应该是项目编译配置使用的Java版本不对，需要检查一下项目及环境使用的Java编译版本配置。</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;《1》在Intellij中点击“<span style="color:#3399ea;">File</span>” --&gt;“<span style="color:#3399ea;">Project Structure</span>”，看一下“Project”和“Module”栏目中Java版本是否与本地一致：</p>

<p><img alt="" class="has" height="387" src="https://img-blog.csdn.net/20180904233036107?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIyMDc2MzQ1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" width="709"></p>

<p>&nbsp;</p>

<p><img alt="" class="has" height="494" src="https://img-blog.csdn.net/20180904233152909?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIyMDc2MzQ1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" width="970"></p>

<p>如果不一致，改成本地使用的Java版本。</p>

<p>&nbsp; &nbsp; &nbsp; 《2》点击“<span style="color:#3399ea;">Settings</span>”--&gt;“<span style="color:#3399ea;">Bulid, Execution,Deployment</span>”--&gt;“<span style="color:#3399ea;">Java Compiler</span>”，<strong>Target bytecode version</strong>设为本地Java版本。（可以在<span style="color:#3399ea;">Default Settings</span>中把<strong>Project bytecode version </strong>一劳永逸地配置成本地Java版本）</p>

<p><img alt="" class="has" height="709" src="https://img-blog.csdn.net/201809042343056?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIyMDc2MzQ1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" width="1043"></p>

<p><span style="color:#3399ea;">Default Settings</span>：</p>

<p><img alt="" class="has" height="465" src="https://img-blog.csdn.net/20180904234401401?watermark/2/text/aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzIyMDc2MzQ1/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70" width="1017"></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp;以上两步都配置好之后，重新运行应该就不会报上述错误了。</p>                                    </div>