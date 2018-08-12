package cn.jaeblog.annotation;

//自定义注解
public @interface MyBatisRepository {
	String message() default "";
}
