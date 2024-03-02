
import config.connect;

public class index {
    public static void main(String[] args) {
        @SuppressWarnings("unused")
        connect conn = new connect();
        connect.connect();

        System.out.println("Hello World");

    }
}
