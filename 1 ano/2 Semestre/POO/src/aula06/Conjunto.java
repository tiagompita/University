package aula06;

public class Conjunto {
    private int[] vetores;
    private int size;

    public Conjunto() {
        vetores = new int[1]; 
        size = 0;
    }

    public void insert(int n) {
        for (int i = 0; i < size; i++) {
            if (vetores[i] == n) {
                return;
            }
        }

        if (size == vetores.length) {
            int[] newVetores = new int[size + 1];
            System.arraycopy(vetores, 0, newVetores, 0, size);
            vetores = newVetores;
        }

        vetores[size] = n;
        size++;
    }

    public boolean contains(int n) {
        for (int i = 0; i < vetores.length; i++) {
            if (vetores[i] == n) {
                return true;
            }
        }
        return false;
    }

    public void remove(int n) {
        for (int i = 0; i < size; i++) {
            if (vetores[i] == n) {
                int[] newVetores = new int[size - 1];
                for (int j = 0, k = 0; j < size; j++) {
                    if (j == i) continue;
                    newVetores[k++] = vetores[j];
                }
                vetores = newVetores;
                size--;
                return;
            }
        }
    }

    public void empty() {
        vetores = new int[0];
        size = 0;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < vetores.length; i++) { 
            sb.append(vetores[i]);
            if (i < vetores.length - 1) {
                sb.append(" ");
            }
        }
        return sb.toString();
    }

    public int size() {
        return vetores.length;
    }

    public Conjunto combine(Conjunto add) {
        Conjunto result = new Conjunto();
        for (int x : this.vetores) {
            result.insert(x);
        }
        for (int y : add.vetores) {
            result.insert(y);
        }
        return result;
    }

    public Conjunto substract(Conjunto diff) {
        Conjunto result = new Conjunto();
        for (int x : this.vetores) {
            result.insert(x);
            for (int y : diff.vetores) {
                if ( x == y ) {
                    result.remove(y);
                }
            }
        }
        
        return result;
    }

    public Conjunto intersect(Conjunto inter) {
        Conjunto result = new Conjunto();
        for (int x : this.vetores) {
            if (inter.contains(x)) {
                result.insert(x);
            }
        }
        return result;
    }

    public static void main(String[] args) {
        Conjunto c1 = new Conjunto();
        c1.insert(4); c1.insert(7); c1.insert(6); c1.insert(5);
        
        Conjunto c2 = new Conjunto();
        int[] test = { 7, 3, 2, 5, 4, 6, 7};
        for (int el : test) c2.insert(el);
        c2.remove(3); c2.remove(5); c2.remove(6);
        
        System.out.println(c1);
        System.out.println(c2);
        
        System.out.println("Número de elementos em c1: " + c1.size());
        System.out.println("Número de elementos em c2: " + c2.size());
        System.out.println("c1 contém 6?: " + ((c1.contains(6) ? "sim" : "não")));
        System.out.println("c2 contém 6?: " + ((c2.contains(6) ? "sim" : "não")));
        
        System.out.println("União:" + c1.combine(c2));
        System.out.println("Interseção:" + c1.intersect(c2));
        System.out.println("Diferença:" + c1.substract(c2));
        
        c1.empty();
        System.out.println("c1:" + c1);
    }
}