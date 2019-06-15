package ceshishejimoshi;

public class daili implements compter {
    @Override
    public String sallCompter(double money) {
        System.out.println("买电脑花了"+money);
        return "炫龙电脑";
    }

    @Override
    public void show() {
        System.out.println("展示电脑");
    }
}
