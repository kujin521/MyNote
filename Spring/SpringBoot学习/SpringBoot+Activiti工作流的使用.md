

# 了解工作流



# 开始使用 Activiti 和 Spring Boot

> Spring Boot中的约定配置方法与Activiti的流程引擎设置和使用很好地配合。开箱即用，您只需要一个数据库

## 工作流的具体应用:

```
关键业务流程：订单、报价处理、合同审核、客户电话处理、供应链管理等
行政管理类:出差申请、加班申请、请假申请、用车申请、各种办公用品申请、购买申请、日报
周报等凡是原来手工流转处理的行政表单。
人事管理类：员工培训安排、绩效考评、职位变动处理、员工档案信息管理等。
财务相关类：付款请求、应收款处理、日常报销处理、出差报销、预算和计划申请等。
客户服务类：客户信息管理、客户投诉、请求处理、售后服务管理等
特殊服务类：ISO 系列对应流程、质量管理对应流程、产品数据信息管理、贸易公司报关处理、
物流公司货物
```

## 创建maven项目

```xml
<dependency>
    <groupId>org.activiti</groupId>
    <artifactId>spring-boot-starter-basic</artifactId>
    <version>${activiti.version}</version>
</dependency>
<dependency>
    <groupId>com.h2database</groupId>
    <artifactId>h2</artifactId>
    <version>1.4.185</version>
</dependency>
```



```java
@Bean
CommandLineRunner init( final RepositoryService repositoryService,
                              final RuntimeService runtimeService,
                              final TaskService taskService) {

    return new CommandLineRunner() {

        public void run(String... strings) throws Exception {
            Map<String, Object> variables = new HashMap<String, Object>();
            variables.put("applicantName", "John Doe");
            variables.put("email", "john.doe@activiti.com");
            variables.put("phoneNumber", "123456789");
            runtimeService.startProcessInstanceByKey("hireProcess", variables);
        }
    };
}
```





```java
@Component
public class ResumeService {

    public void storeResume() {
        System.out.println("Storing resume ...");
    }

}
```





```xml
<dependency>
    <groupId>org.activiti</groupId>
    <artifactId>spring-boot-starter-rest-api</artifactId>
    <version>${activiti.version}}</version>
</dependency>
```

