public class App {
    public static void main (String[] args) {
        int[] a = {1, 3};
        System.out.println(f1(1, true));
        System.out.println(f2(a));
        System.out.println(f3("12-MX.4A"));
        
        String s1 = "abcdef";
        s1.charAt(0);
        s1.length();

        System.out.println(s1.matches("\\w{3,}"));
        System.out.println(15%13);
        System.out.println(15/13);

        int[] vec = new int[10];
        System.out.println(vec.length);
        System.out.println(vec[0]);

        int[][] ab = { {1,2,3}, {4,5,6} };
        
        for (int i = 0; i < ab.length; i++) {
            for (int j = 0; j < ab[i].length; j++) {
                System.out.print(ab[i][j] + " ");
            }
            System.out.println();
        }

        int x = 5;
        System.out.println(++x);
        
    }

    public static int f1(int a, boolean b) {
        int r = 2;
        while (b) {
            r += a++;
            b = r % 2 == 0;
        }
        return r;
    }

    public static int f2(int[] v) {
        int w[] = {1, 2, 3}, r = 0;
        for (int i = 1; i < v.length && i < w.length; i++)
            r += w[i] + v[i];
        
        return r;
    }

    public static boolean f3(String st){
        return st.matches("\\d{2}-\\w{2}-\\w{2}");
    }
}
