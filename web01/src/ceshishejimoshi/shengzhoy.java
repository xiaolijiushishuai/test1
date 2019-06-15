package ceshishejimoshi;

import org.springframework.cglib.proxy.InvocationHandler;
import org.springframework.cglib.proxy.Proxy;

import java.lang.reflect.Method;

public class shengzhoy {
    public static void main(String[] args) {
        daili da=new daili();
        compter uio=(compter) Proxy.newProxyInstance(da.getClass().getClassLoader(), da.getClass().getInterfaces(), new InvocationHandler() {
            @Override
            public Object invoke(Object o, Method method, Object[] objects) throws Throwable {
                if(method.getName().equals("sallCompter")) {
                    double money = (double) objects[0] * 0.8;
                    Object invoke = method.invoke(da, money);
                    return invoke;
                }
                else {
                    return null;
                }
            }
        });
        String s = uio.sallCompter(990);
        System.out.println(s);
       // uio.show();
    }
}
